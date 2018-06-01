<?php
  /**
   *
   */
  class Chat
  {
    private $chatID=0;
    private $usersList=[];
    private $chatTitle="";
    private $textsList=[];

    function __construct($chatID,$usersList,$chatTitle,$textsList)
    {
      $this->chatID = $chatID;
      $this->usersList = $usersList;
      $this->chatTitle = $chatTitle;
      $this->textsList = $textsList;

    }


    public function getChatData($attr){
      switch ($attr) {
        case 'chatID':
          return $this->chatID;
          break;
          case 'usersList':
            return $this->usersList;
            break;
            case 'chatTitle':
              return $this->chatTitle;
              break;
              case 'textsList':
                return $this->textsList;
                break;

        default:
          return "Could not find ".$attr;
          break;
      }

    }


    public function setChatData($attr,$value){
      switch ($attr) {
        case 'chatID':
          $this->chatID = $value;
          break;
          case 'usersList':
            $this->usersList = $value;
            break;
            case 'chatTitle':
              $this->chatTitle = $value;
              break;
              case 'textsList':
                $this->textsList = $value;
                break;

        default:
          "Could not set ".$attr;
          break;
      }
    }
  }

  $theObject = new Chat(1,2,3,4);
  echo $theObject->setChatData("chatTitle","NEWA on AAU");
  echo $theObject->getChatData("chatTitle");
 ?>
