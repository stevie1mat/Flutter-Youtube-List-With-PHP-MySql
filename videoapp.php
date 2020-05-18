 <?php 
class Constants
{
    //DATABASE DETAILS
    static $DB_SERVER="";
    static $DB_NAME="";
    static $USERNAME="";
    static $PASSWORD="";
    //STATEMENTS
    static $SQL_SELECT_ALL="SELECT * FROM videosapp";
}
class Spacecrafts
{
    /*******************************************************************************************************************************************/
    /*
       1.CONNECT TO DATABASE.
       2. RETURN CONNECTION OBJECT
    */
    public function connect()
    {
        $con=new mysqli(Constants::$DB_SERVER,Constants::$USERNAME,Constants::$PASSWORD,Constants::$DB_NAME);
        if($con->connect_error)
        {
            // echo "Unable To Connect"; - For debug
            return null;
        }else
        {
            //echo "Connected"; - For debug
            return $con;
        }
    }
    /*******************************************************************************************************************************************/
    /*
       1.SELECT FROM DATABASE.
    */
    public function select()
    {
        $con=$this->connect();
        if($con != null)
        {
            $result=$con->query(Constants::$SQL_SELECT_ALL);
            if($result->num_rows>0)
            {
                $spacecrafts=array();
                while($row=$result->fetch_array())
                {
                    array_push($spacecrafts, array("youtubeid"=>$row['youtubeid']));
                }
                print(json_encode(array_reverse($spacecrafts)));
            }else
            {
                print(json_encode(array("PHP EXCEPTION : CAN'T RETRIEVE FROM MYSQL. ")));
            }
            $con->close();
        }else{
            print(json_encode(array("PHP EXCEPTION : CAN'T CONNECT TO MYSQL. NULL CONNECTION.")));
        }
    }
}
$spacecrafts=new Spacecrafts();
$spacecrafts->select();
//end

