

<p align="center">
<img src="https://ya-webdesign.com/images/youtube-logo-button-png.png" height="100px" width="100px">
</p>

<p align="center">
  <b>Flutter Youtube List From PHP - MySQL (using phpmyadmin)</b>
</p>

  <p align="center">Flutter youtube list view using PHP and MySQL by converting it into json and the parsing it in the Flutter app. You can also use json directly if You don't want to use PHP. (All of these work remotely so You can edit and change it.)</p>
  
  <br/>
  <p>Packages Used</p>
  <ul>
  <li><a href="https://pub.dev/packages/http">HTTP</a></li>
  <li><a href="https://pub.dev/packages/youtube_player_flutter">Youtube Player Flutter</a></li>
  </ul>
 
 <i>Update to the lastest version so that You don't face any errors.</i>
  
  <br/>
  <p align="center">
  Steps For Setting This Up:
  <ul>
  <li>Create A SQL Table</li>
    <code>
      CREATE TABLE `videosapp` (
  `youtubeid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
<br/>

ALTER TABLE `videosapp`
  ADD PRIMARY KEY (`youtubeid`);
COMMIT;
      </code>
  
  </ul>
  
  <ul>
  <li>Edit the videoapp.php file with Your credentials & table name and upload it to Your server.
  </ul>
   
  <ul>
  <li>Finally change the link to php file in the list.dart file. Sample link has been provided Please don't misuse it in any way.
  </ul>
  <br/>
  <p align="center"><b> Screen Shots</b></p>
  <p align="left">

  <img src="https://sjmodelagency.com/app/3.jpeg" width="400px">
  <img src="https://sjmodelagency.com/app/2.jpeg"  width="400px">
</p>
  </p>
  
