<?php
  /**
   *
   */
  class User
  {
    private $userID=0;
    private $email="";
    private $name="";
    private $role="";
    private $age=0;
    private $sex="";
    private $occupation="";
    private $isMember="";

    function __construct($userID,$email,$name,$role,$age,$sex,$occupation,$isMember)
    {
      $this->userID = $userID;
      $this->email = $email;
      $this->name = $name;
      $this->role = $role;
      $this->age = $age;
      $this->sex = $sex;
      $this->occupation = $occupation;
      $this->isMember = $isMember;
    }


    public function getUserData($attr){
      switch ($attr) {
        case 'userID':
          return $this->userID;
          break;
          case 'email':
            return $this->email;
            break;
            case 'name':
              return $this->name;
              break;
              case 'role':
                return $this->role;
                break;
                case 'age':
                  return $this->age;
                  break;
                  case 'sex':
                    return $this->sex;
                    break;
                    case 'occupation':
                      return $this->occupation;
                      break;
                      case 'isMember':
                        return $this->isMember;
                        break;
        default:
          return "Error happened";
          break;
      }

    }



    public function setUserData($attr,$value){
      switch ($attr) {
        case 'userID':
          $this->userID = $value;
          break;
          case 'email':
            $this->email = $value;
            break;
            case 'name':
              $this->name = $value;
              break;
              case 'role':
                $this->role = $value;
                break;
                case 'age':
                  $this->age = $value;
                  break;
                  case 'sex':
                    $this->sex = $value;
                    break;
                    case 'occupation':
                      $this->occupation = $value;
                      break;
                      case 'isMember':
                        $this->isMember = $value;
                        break;
        default:

          break;
      }
    }

  }

  // $theObject = new User(1,2,3,4,5,6,7,8);
  //
  // echo $theObject->setUserData("name","Abebe");
  // echo $theObject->getUserData("name");
 ?>
