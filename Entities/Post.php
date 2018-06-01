<?php
  /**
   *
   */
  class Post
  {
    private $postID=0;
    private $posterID=0;
    private $postTitle="";
    private $postContent="";

    function __construct($postID,$posterID,$postTitle,$postContent)
    {
      $this->postID = $postID;
      $this->posterID = $posterID;
      $this->postTitle = $postTitle;
      $this->postContent = $postContent;

    }


    public function getPostData($attr){
      switch ($attr) {
        case 'postID':
          return $this->postID;
          break;
          case 'posterID':
            return $this->posterID;
            break;
            case 'postTitle':
              return $this->postTitle;
              break;
              case 'postContent':
                return $this->postContent;
                break;

        default:
          return "Could not find ".$attr;
          break;
      }

    }


    public function setPostData($attr,$value){
      switch ($attr) {
        case 'postID':
          $this->postID = $value;
          break;
          case 'posterID':
            $this->posterID = $value;
            break;
            case 'postTitle':
              $this->postTitle = $value;
              break;
              case 'postContent':
                $this->postContent = $value;
                break;

        default:
          "Could not set ".$attr;
          break;
      }
    }
  }

  // $theObject = new Post(1,2,3,4);
  // echo $theObject->setPostData("postTitle","Public Disturbance");
  // echo $theObject->getPostData("postTitle");
 ?>
