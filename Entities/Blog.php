<?php
  /**
   *
   */
  class Blog
  {
    private $blogID=0;
    private $bloggerID=0;
    private $blogTitle="";
    private $blogContent="";
    private $commentList=[];

    function __construct($blogID,$bloggerID,$blogTitle,$blogContent,$commentList)
    {
      $this->blogID = $blogID;
      $this->bloggerID = $bloggerID;
      $this->blogTitle = $blogTitle;
      $this->blogContent = $blogContent;
      $this->commentList = $commentList;

    }


    public function getBlogData($attr){
      switch ($attr) {
        case 'blogID':
          return $this->blogID;
          break;
          case 'bloggerID':
            return $this->bloggerID;
            break;
            case 'blogTitle':
              return $this->blogTitle;
              break;
              case 'blogContent':
                return $this->blogContent;
                break;
                case 'commentList':
                  return $this->commentList;
                  break;

        default:
          return "Could not find ".$attr;
          break;
      }

    }


    public function setBlogData($attr,$value){
      switch ($attr) {
        case 'blogID':
          $this->blogID = $value;
          break;
          case 'bloggerID':
            $this->bloggerID = $value;
            break;
            case 'blogTitle':
              $this->blogTitle = $value;
              break;
              case 'blogContent':
                $this->blogContent = $value;
                break;
                case 'commentList':
                  $this->commentList = $value;
                  break;

        default:
          "Could not set ".$attr;
          break;
      }
    }
  }

  // $theObject = new Blog(1,2,3,4,5);
  // echo $theObject->setBlogData("commentList","Nice One");
  // echo $theObject->getBlogData("commentList");
 ?>
