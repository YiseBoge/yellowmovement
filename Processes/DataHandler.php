<?php
  require(dirname(__FILE__).'/../configs/database.php');
 ?>

<?php

/**
 *
 */
class DataHandler
{


  function __construct()  {}

  public static function getData($type,$value='')
  {
    global $thePDO;
    switch ($type) {

        case 'chatsList':

          $theSql = 'select chat_title,last_modified from Chats where chatID in (select chatID from ChatMembers where memberID = :id) order by last_modified desc';
          $theStmt = $thePDO->prepare($theSql);
          $theStmt->execute(['id'=>$value]);
          $theResult = $theStmt->fetchAll();

          break;


          case 'requests':

            $theSql = 'select * from Requests order by time_requested desc';
            $theStmt = $thePDO->query($theSql);
            $theResult = $theStmt->fetchAll();

            break;


            case 'userDetails':
              $theSql = 'select userID,email,name,age,sex,occupation,member,role,profile_pic from Users where userID = :userID or email = :email';
              $theStmt = $thePDO->prepare($theSql);
              $theStmt->execute($value);
              $theResult = $theStmt->fetchAll();

              break;


              case 'blogsList':
                $theSql = 'select name,blog_title,blog_time from Users,Blogs where bloggerID = userID order by blog_time desc';
                $theStmt = $thePDO->query($theSql);
                $theResult = $theStmt->fetchAll();

                break;


                case 'postsList':
                  $theSql = 'select name,post_title,post_time from Users,Posts where posterID = userID order by post_time desc';
                  $theStmt = $thePDO->query($theSql);
                  $theResult = $theStmt->fetchAll();

                  break;


                  case 'usersList':
                    $theSql = 'select userID,name,role,sex from Users where not role="admin" order by name';
                    $theStmt = $thePDO->query($theSql);
                    $theResult = $theStmt->fetchAll();

                    break;


                    case 'emailsList':
                      $theSql = 'select email from Users';
                      $theStmt = $thePDO->query($theSql);
                      $theResult = $theStmt->fetchAll();

                      break;


                      case 'comments':
                        $theSql = 'select commenterID,comment_text,comment_time from BlogComments where blogID =:blogID order by comment_time desc';
                        $theStmt = $thePDO->prepare($theSql);
                        $theStmt->execute(['blogID'=>$value]);
                        $theResult = $theStmt->fetchAll();

                        break;


                        case 'login':
                          $theSql = 'select email,password from Users where email =:email';
                          $theStmt = $thePDO->prepare($theSql);
                          $theStmt->execute(['email'=>$value]);
                          $theResult = $theStmt->fetch();

                          break;


                          case 'blogDetails':
                            $theSql = 'select blogID,bloggerID,blog_title,blog_content,blog_time from Blogs where blogID = :blogID';
                            $theStmt = $thePDO->prepare($theSql);
                            $theStmt->execute(['blogID'=>$value]);
                            $theResult = $theStmt->fetchAll();

                            break;


                            case 'postDetails':
                              $theSql = 'select postID,post_title,post_content,post_image,post_time from Posts where postID = :postID';
                              $theStmt = $thePDO->prepare($theSql);
                              $theStmt->execute(['postID'=>$value]);
                              $theResult = $theStmt->fetchAll();

                              break;


                              case 'chatDetails':
                                $theSql = 'select chatID,chat_title from Chats where chatID = :chatID';
                                $theStmt = $thePDO->prepare($theSql);
                                $theStmt->execute(['chatID'=>$value]);
                                $theResult = $theStmt->fetchAll();

                                break;


                                case 'chatMembers':
                                  $theSql = 'select memberID from ChatMembers where chatID = :chatID';
                                  $theStmt = $thePDO->prepare($theSql);
                                  $theStmt->execute(['chatID'=>$value]);
                                  $theResult = $theStmt->fetchAll();

                                  break;


                                  case 'chatTexts':
                                    $theSql = 'select texterID,content,text_time from ChatTexts where chatID = :chatID';
                                    $theStmt = $thePDO->prepare($theSql);
                                    $theStmt->execute(['chatID'=>$value]);
                                    $theResult = $theStmt->fetchAll();

                                    break;



      default:
        echo "wrong get command";
        break;

    }
    return $theResult;
  }


  public static function removeData($type,$value='')
  {
    global $thePDO;
    switch ($type) {
      case 'chat':
        $theSql = 'delete from Chats where chatID = :chatID';
        $theStmt = $thePDO->prepare($theSql);
        $theStmt->execute(['chatID'=>$value]);

        break;

      default:
        // code...
        break;
    }
  }


  public static function saveData($type,$value='')
  {
    global $thePDO;
    switch ($type) {
      case 'newUser':
        $value['password'] = crypt($value['password'],'$1$yellowmovement$');
        $theSql = 'insert into Users(email,name,password,sex) values(:email,:name,:password,:sex)';
        $theStmt = $thePDO->prepare($theSql);
        $theStmt->execute($value);

        break;


        case 'newPost':
          $theSql = 'insert into Posts(post_title,post_content,post_image) values(:postTitle,:postContent,:postImage)';
          $theStmt = $thePDO->prepare($theSql);
          $theStmt->execute($value);

          break;


          case 'newBlog':
            $theSql = 'insert into Blogs(bloggerID,blog_title,blog_content) values(:bloggerID,:blogTitle,:blogContent)';
            $theStmt = $thePDO->prepare($theSql);
            $theStmt->execute($value);

            break;


            case 'newChat':
              $usersList = $value['usersList'];

              $theSql = 'insert into Chats(chat_title,chat_description) values(:chatTitle,:chatDescription)';
              $theStmt = $thePDO->prepare($theSql);
              $theStmt->execute(['chatTitle'=>$value['chatTitle'],'chatDescription'=>$value['chatDescription']]);




              $theSql = 'insert into ChatMembers(chatID,memberID) select chatID,:memberID from Chats where chat_title = :chatTitle';
              $theStmt = $thePDO->prepare($theSql);
              $theStmt->execute(['memberID'=>1,'chatTitle'=>$value['chatTitle']]);
              foreach ($usersList as $userID) {
                $theSql = 'insert into ChatMembers(chatID,memberID) select chatID,:memberID from Chats where chat_title = :chatTitle';
                $theStmt = $thePDO->prepare($theSql);
                $theStmt->execute(['memberID'=>$userID,'chatTitle'=>$value['chatTitle']]);
              }

              break;

              case 'newRequest':
                $theSql = 'insert into Requests(requesterID) values(:requesterID)';
                $theStmt = $thePDO->prepare($theSql);
                $theStmt->execute($value);

                break;


              case 'newComment':
                $theSql = 'insert into BlogComments(blogID,commenterID,comment_text) values(:blogID,:commenterID,:commentText)';
                $theStmt = $thePDO->prepare($theSql);
                $theStmt->execute($value);

                break;


                case 'chatText':
                  $theSql = 'insert into ChatTexts(chatID,texterID,content) values(:chatID,:texterID,:content)';
                  $theStmt = $thePDO->prepare($theSql);
                  $theStmt->execute($value);

                  break;

      default:
        echo "wrong  save command";
        break;
    }
  }


  public static function updateData($type,$value='')
  {
    global $thePDO;
    switch ($type) {
      case 'requestResponse':
        $theSql = 'update Requests set status=:status where requesterID=:requesterID';
        $theStmt = $thePDO->prepare($theSql);
        $theStmt->execute($value);

        if ($value['status'] == 'granted') {
          $role = 'blogger';
        } else{
          $role = 'user';
        }
        $theSql = 'update Users set role=:role where userID=:requesterID';
        $theStmt = $thePDO->prepare($theSql);
        $theStmt->execute(['requesterID'=>$value['requesterID'],'role'=>$role]);

        break;


        case 'seeRequest':
          $theSql = 'update Requests set seen=1 where requesterID=:requesterID';
          $theStmt = $thePDO->prepare($theSql);
          $theStmt->execute($value);

          break;


          case 'userAccount':
            $value['password'] = crypt($value['password'],'$1$yellowmovement$');
            $theSql = 'update Users set email=:email,age=:age,name=:name,sex=:sex,occupation=:occupation,member=:isMember,profile_pic=:profilePic where userID = :userID';
            $theStmt = $thePDO->prepare($theSql);
            $theStmt->execute($value);

            break;


            case 'password':
              $value['password'] = crypt($value['password'],'$1$yellowmovement$');
              $theSql = 'update Users set password = :password where userID = :userID';
              $theStmt = $thePDO->prepare($theSql);
              $theStmt->execute($value);

              break;


      default:
        // code...
        break;
    }
  }
}


// // ----commented out is tested to work in normal cases---- // //
//--------------------------------------------//
//Get Data Trial

// var_dump(
//
// // DataHandler::getData('chatsList',2)
// // DataHandler::getData('userDetails',['userID'=>2,'email'=>0])
// // DataHandler::getData('blogsList')
// // DataHandler::getData('postsList')
// // DataHandler::getData('usersList')
// // DataHandler::getData('comments',1)
// // DataHandler::getData('login','example1@example.com')
// // DataHandler::getData('postDetails',2)
// // DataHandler::getData('blogDetails',2)
// // DataHandler::getData('chatDetails',2)
// // DataHandler::getData('chatMembers',4)
// // DataHandler::getData('chatTexts',1)
//
// );



//--------------------------------------------//
// Remove Data Trial

// DataHandler::removeData('chat',7)



//--------------------------------------------//
// Save Data Trial

// DataHandler::saveData('newUser',['email'=>'example6@example.com','name'=>'User 6','password'=>'0000','sex'=>'female']);
// DataHandler::saveData('newPost',['postTitle'=>'Post 3','postContent'=>'here we have post 3 have fun with it','postImage'=>null]);
// DataHandler::saveData('newBlog',['bloggerID'=>4,'blogTitle'=>'Blog4','blogContent'=>'And so i keep blogging for the sake of humanity']);
// DataHandler::saveData('newChat',['chatTitle'=>'Fourth Chat','chatDescription'=>'and so we describe chat 4','usersList'=>[1,2,4]]);
// DataHandler::saveData('newRequest',['requesterID'=>2]);
// DataHandler::saveData('newComment',['blogID'=>1,'commenterID'=>2,'commentText'=>'This is my secod comment again']);
// DataHandler::saveData('chatText',['chatID'=>1,'texterID'=>2,'content'=>'And so my text starts']);


//--------------------------------------------//
// Update Data Trial


// DataHandler::updateData('requestResponse',['status'=>'granted','requesterID'=>2]);
// DataHandler::updateData('userAccount',['userID'=>5,'email'=>'example5@example.com','age'=>'23','name'=>'User 5','sex'=>'male','occupation'=>'Doctor','isMember'=>0,'profilePic'=>null]);
// DataHandler::updateData('password',['userID'=>5,'password'=>'0000']);


 ?>
