<!DOCTYPE html>
<?php
	require_once 'auth.php';
?>
<html lang="en">
<head>
	<title>Record | Employee Attendance Record System</title>
	<?php include('header.php') ?>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<style>
	.generate-report-btn {
		width: 150px;
	}
	</style>
</head>
<body>
	<?php include('nav_bar.php') ?>
	<div class="container-fluid admin">
		<div class="alert alert-primary">Record List</div>
		<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModallabel">
		</div>
		<div class="well col-lg-12">
			<div class="row mb-3">
				<div class="col-md-4">
					<label for="start_date">Start Date:</label>
					<input type="date" class="form-control" id="start_date">
				</div>
				<div class="col-md-4">
					<label for="end_date">End Date:</label>
					<input type="date" class="form-control" id="end_date">
				</div>
				<div class="col-md-4">
					<label for="">&nbsp;</label>
					<button class="btn btn-primary btn-block generate-report-btn" id="generate_report">Generate Report</button>
				</div>
			</div>
		</div>
		<table id="table" class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Employee Number</th>
					<th>Date</th>
					<th>Total Hours</th>
					<th>Latitude</th>
		<th>Longitude</th>
				</tr>
			</thead>
			<tbody>
			<?php
$attendance_qry = $conn->query("SELECT a.*, concat(e.firstname,' ',e.middlename,' ',e.lastname) as name, e.employee_no FROM `attendance` a INNER JOIN employee e ON a.employee_id = e.id ORDER BY a.datetime_log") or die(mysqli_error());

$employee_hours = array(); // Initialize the array

while ($row = $attendance_qry->fetch_array()) {
    $employee_no = $row['employee_no'];
    $date = date("Y-m-d", strtotime($row['datetime_log']));
    $time = date("H:i:s", strtotime($row['datetime_log']));
    $log_type = $row['log_type'];

    if (!isset($employee_hours[$employee_no][$date])) {
        $employee_hours[$employee_no][$date] = array(
            'in_time' => null,
            'out_time' => null,
            'latitude' => null,
            'longitude' => null
        );
    }

    if ($log_type == 1) {
        // In-time
        $employee_hours[$employee_no][$date]['in_time'] = $time;
        if (isset($row['latitude'])) {
            $employee_hours[$employee_no][$date]['latitude'] = $row['latitude'];
        }
        if (isset($row['longitude'])) {
            $employee_hours[$employee_no][$date]['longitude'] = $row['longitude'];
        }
    } elseif ($log_type == 4) {
        // Out-time
        $employee_hours[$employee_no][$date]['out_time'] = $time;
        if (isset($row['latitude'])) {
            $employee_hours[$employee_no][$date]['latitude'] = $row['latitude'];
        }
        if (isset($row['longitude'])) {
            $employee_hours[$employee_no][$date]['longitude'] = $row['longitude'];
        }
    }
}

// Display the calculated hours for the selected date range
$start_date = isset($_GET['start_date']) ? date("Y-m-d", strtotime($_GET['start_date'])) : null;
$end_date = isset($_GET['end_date']) ? date("Y-m-d", strtotime($_GET['end_date'])) : null;

foreach ($employee_hours as $employee_no => $dates) {
    foreach ($dates as $date => $times) {
        if (($start_date && $date < $start_date) || ($end_date && $date > $end_date)) {
            continue; // Skip the dates outside the selected range
        }

        $in_time = $times['in_time'];
        $out_time = $times['out_time'];
        $latitude = isset($times['latitude']) ? $times['latitude'] : '';
        $longitude = isset($times['longitude']) ? $times['longitude'] : '';

        if ($in_time && $out_time && $out_time > $in_time) {
            $duration = strtotime($out_time) - strtotime($in_time);

            // Convert the duration to hours and minutes
            $hours = floor($duration / 3600);
            $minutes = floor(($duration % 3600) / 60);

            echo "<tr>";
            echo "<td>" . $employee_no . "</td>";
            echo "<td>" . date("F d, Y", strtotime($date)) . "</td>";
            echo "<td>" . $hours . " hours, " . $minutes . " minutes</td>";
            echo "<td>" . $latitude . "</td>";
            echo "<td>" . $longitude . "</td>";
            echo "</tr>";
        }
    }
}
?>

			</tbody>
		</table>
		<br />
		<br />
		<br />
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function(){
		var table = $('#table').DataTable();

		$('#search_employee_id_button').click(function() {
			var searchValue = $('#search_employee_id').val().trim();
			table.columns(0).search(searchValue).draw();
		});

		$('#generate_report').click(function() {
			var start_date = $('#start_date').val();
			var end_date = $('#end_date').val();

			// Refresh the page with the selected start and end dates as query parameters
			window.location.href = window.location.pathname + '?start_date=' + start_date + '&end_date=' + end_date;
		});
	});
</script>
</html>
