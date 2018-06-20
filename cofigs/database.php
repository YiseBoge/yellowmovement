<?php
  require_once(dirname(__FILE__).'/config.php');
 ?>

<?php
class PDOConnection {

    protected static $_instance = null;

    public static function instance() {
        if ( !isset( self::$_instance ) ) {
            self::$_instance = new PDOConnection();
        }

        return self::$_instance;
    }

    protected function __construct() {}

    function __destruct(){}


    public static function getConnection($dsn, $username, $password) {

        $conn = null;
        try {

            $conn = new \PDO($dsn, $username, $password);

            $conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
            $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);

            return $conn;

        } catch (PDOException $e) {
            throw $e;

        }
        catch(Exception $e) {
            throw $e;
        }
    }

    public function __clone()
    {
        return false;
    }
    public function __wakeup()
    {
        return false;
    }
}

$thePDO = PDOConnection::getConnection(DB_DSN,DB_USER,DB_PASS);
?>
