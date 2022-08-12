<?php
    $conn = mysqli_connect("localhost", "root", "", "Rent-A-Car");
    if ($conn->connect_error) {
      die("Connection failed: " . $conn-> connect_error);
     }   //  error if connection failed

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/tablcss.css" />
    <title>Rent a Car</title>
    <link rel="stylesheet" href="/fontawesome-free-6.1.1-web/css/all.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
    <div class="hero-img"></div>
    <div class="wrapper">
      <header>
        <a href="#">
          <img class="logo" src="img/logo.png" alt="logo" />
        </a>
        <nav>
          <svg
            class="close"
            viewBox="0 0 36 36"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M19.41 18L27.7 9.71C27.8638 9.5187 27.9494 9.27262 27.9397 9.02095C27.93 8.76927 27.8256 8.53053 27.6475 8.35244C27.4694 8.17434 27.2307 8.07001 26.979 8.06029C26.7274 8.05057 26.4813 8.13618 26.29 8.3L18 16.59L9.70997 8.29C9.52167 8.1017 9.26627 7.99591 8.99997 7.99591C8.73367 7.99591 8.47828 8.1017 8.28997 8.29C8.10167 8.47831 7.99588 8.7337 7.99588 9C7.99588 9.2663 8.10167 9.5217 8.28997 9.71L16.59 18L8.28997 26.29C8.18529 26.3796 8.10027 26.49 8.04025 26.614C7.98022 26.7381 7.94649 26.8732 7.94117 27.0109C7.93586 27.1487 7.95906 27.286 8.00934 27.4143C8.05961 27.5427 8.13587 27.6592 8.23332 27.7567C8.33078 27.8541 8.44733 27.9304 8.57565 27.9806C8.70398 28.0309 8.84131 28.0541 8.97903 28.0488C9.11675 28.0435 9.25188 28.0098 9.37594 27.9497C9.50001 27.8897 9.61033 27.8047 9.69997 27.7L18 19.41L26.29 27.7C26.4813 27.8638 26.7274 27.9494 26.979 27.9397C27.2307 27.93 27.4694 27.8257 27.6475 27.6476C27.8256 27.4695 27.93 27.2307 27.9397 26.9791C27.9494 26.7274 27.8638 26.4813 27.7 26.29L19.41 18Z"
              fill="black"
            />
          </svg>
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#why">Info</a></li>
            <li><a href="#contact-us">Contact us</a></li>
          </ul>
        </nav>
        <svg
          class="ham-men"
          viewBox="0 0 48 32"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M24 32H0V26.6667H24V32ZM48 18.6667H0V13.3333H48V18.6667ZM48 5.33333H24V0H48V5.33333Z"
            fill="white"
          />
        </svg>
      </header>

      <section class="hero">
        <h1>Car rental agency</h1>
        <p class="sub-head">
          The best car rental agency for the everyday preson. Here you can find the best cars and deals.
        </p>
      </section>

      <section class="more-info">
        <div class="feature">
          <div class="content" id="why">
            <p class="title">Categories</p>
            <p class="desc">
              Lorem ipsum dolor sit amet consectetur, adipisicing elit.
              Aspernatur voluptatibus explicabo a rem placeat. Eveniet?
            </p>
          </div>

          <table class="content-table">
              <thead>
              <tr>
                  <th>Categories Label</th>
                  <th>Categories Description</th>
              </tr>
              </thead>

       <?php  
                $sql = "SELECT * FROM categories";
                $result = $conn-> query($sql); // gets sql query and stores it in result 

                if ($result-> num_rows > 0) { 
                    while ($row = $result-> fetch_assoc()){ // fetches a row in associative array ($row)    
                        echo "<tr><td>". 
                        $row["cat_label"]. "</td><td>".
                        $row["cat_desc"]."</td></tr>"; // $row gets table values and stores them
                    }
                    echo "</table>";
                } else { echo "0 result"; }
                
        ?>

        </table>


        </div>
        <div class="feature flip">
          <div class="content">
            <p class="title">Available Cars</p>
            <p class="desc">
              Lorem ipsum dolor sit amet consectetur, adipisicing elit.
              Aspernatur voluptatibus explicabo a rem placeat. Eveniet?
            </p>
          </div>
          <table class="content-table">
              <thead>
              <tr>
                  <th>Categorie</th>
                  <th>Brand</th>
                  <th>Model</th>
                  <th>Car Description</th>
                  <th>Color</th>
                  <th>Vin Number</th>
                  <th>Make Year</th>
              </tr>
              </thead>

       <?php  
                $sql = "SELECT c.*, cat_label
                FROM cars c 
                LEFT JOIN reservations r 
                ON c.vin_num = r.VIN
                JOIN categories
                USING (cat_id)
                WHERE r.VIN IS NULL;
                ";
                $result = $conn-> query($sql); // gets sql query and stores it in result 

                if ($result-> num_rows > 0) { 
                    while ($row = $result-> fetch_assoc()){ // fetches a row in associative array ($row)    
                        echo "<tr><td>". 
                        $row["cat_label"]. "</td><td>".
                        $row["brand"]. "</td><td>".
                        $row["model"]. "</td><td>".
                        $row["car_desc"]. "</td><td>".
                        $row["color"]. "</td><td>".
                        $row["vin_num"]. "</td><td>".
                        $row["purchase_date"]."</td></tr>"; // $row gets table values and stores them
                    }
                    echo "</table>";
                } else { echo "0 result"; }

        ?>
        
        </table>
        </div>
        <div class="feature">
          <div class="content">
            <p class="title">Locations</p>
            <p class="desc">
              Lorem ipsum dolor sit amet consectetur, adipisicing elit.
              Aspernatur voluptatibus explicabo a rem placeat. Eveniet?
            </p>
          </div>
          <table class="content-table">
              <thead>
              <tr>
                  <th>City</th>
                  <th>Street</th>
                  <th>Street Number</th>
                  <th>Post Code</th>
                  <th>Phone</th>
              </tr>
              </thead>

       <?php  
                $sql = "SELECT l.*, phone_no  
                FROM location l 
                JOIN phone p  
                USING (loc_id);";
                $result = $conn-> query($sql); // gets sql query and stores it in result 

                if ($result-> num_rows > 0) { 
                    while ($row = $result-> fetch_assoc()){ // fetches a row in associative array ($row)    
                        echo "<tr><td>". 
                        $row["city"]. "</td><td>".
                        $row["street"]. "</td><td>".
                        $row["streetnum"]. "</td><td>".
                        $row["post_code"]. "</td><td>".
                        $row["phone_no"]."</td></tr>"; // $row gets table values and stores them
                    }
                    echo "</table>";
                } else { echo "0 result"; }

               
        ?>

        </table>
        </div>

        <div class="feature flip">
          <div class="content">
            <p class="title">Reservations</p>
            <p class="desc">
              Lorem ipsum dolor sit amet consectetur, adipisicing elit.
              Aspernatur voluptatibus explicabo a rem placeat. Eveniet?
            </p>
          </div>
          <table class="content-table">
              <thead>
              <tr>
                  <th>First Name</th>
                  <th>Last Name</th>
                  <th>Brand</th>
                  <th>Model</th>
                  <th>Pick Up Date</th>
                  <th>Return Date</th>
                  <th>Price</th>
              </tr>
              </thead>

       <?php  
                $sql = "SELECT DISTINCT first_name, last_name, brand, model, p_date,r_date,amount  
                FROM reservations
                JOIN cars
                ON vin = vin_num
                LEFT JOIN customers
                ON cust_id = cus_id
                LIMIT 5";
                $result = $conn-> query($sql); // gets sql query and stores it in result 

                if ($result-> num_rows > 0) { 
                    while ($row = $result-> fetch_assoc()){ // fetches a row in associative array ($row)    
                        echo "<tr><td>". 
                        $row["first_name"]. "</td><td>".
                        $row["last_name"]. "</td><td>".
                        $row["brand"]. "</td><td>".
                        $row["model"]. "</td><td>".
                        $row["p_date"]. "</td><td>".
                        $row["r_date"]. "</td><td>".
                        $row["amount"]. "</td></tr>"; // $row gets table values and stores them
                    }
                    echo "</table>";
                } else { echo "0 result"; }
                $conn-> close();
        ?>
        </table>
        </div>
      </section>
    </div>

    <!-- Footer -->
    <footer>
      <div class="main-container" id="contact-us">
        <div class="left box">
          <h2>About us</h2>
          <div class="content1">
            <p>
              Lorem ipsum dolor sit amet consectetur, adipisicing elit. Magni
              quisquam maiores consequatur aut minus quis amet hic facilis
              quidem non?
            </p>
          </div>
        </div>
        <div class="right box">
          <h2>Contact Us</h2>
          <div class="content1">
            <form>
              <div>
                <div class="text">Your Name</div>
                <input type="text" required />
              </div>
              <div>
                <div class="text">Email</div>
                <input type="email" id="email" required />
              </div>
              <div>
                <div class="text">Message</div>
                <textarea cols="25" rows="2"></textarea>
              </div>
              <div class="btn">
                <button type="submit" value="Send" >Submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="bottom">
        <center>
          <span class="credit">Created by Genadi | </span>
          <span class="far fa-copyright">2022 All rights reserved</span>
        </center>
      </div>
    </footer>   
    <script src="main.js"></script>
  </body>
</html>
