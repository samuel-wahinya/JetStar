CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
	/*
	=============================================
		Variable Declaration
	=============================================
	*/
	DECLARE	@start_time DATETIME,
			@end_time DATETIME,
			@batch_start_time DATETIME,
			@batch_end_time DATETIME;

		SET @batch_start_time = GETDATE();
		PRINT '===================================';
		PRINT 'Loading Bronze Layer;'
		PRINT '===================================';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.aircraft';
		TRUNCATE TABLE bronze.aircraft;

		PRINT 'Inserting Data Into: bronze.aircraft';
		BULK INSERT bronze.aircraft
		FROM 'D:\Python\aircraft.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.flights';
		TRUNCATE TABLE bronze.flights;

		PRINT 'Inserting Data Into: bronze.flights';
		BULK INSERT bronze.flights
		FROM 'D:\Python\flights.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.airports';
		TRUNCATE TABLE bronze.airports;

		PRINT 'Inserting Data Into: bronze.airports';
		BULK INSERT bronze.airports
		FROM 'D:\Python\airports.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.routes';
		TRUNCATE TABLE bronze.routes;

		PRINT 'Inserting Data Into: bronze.routes';
		BULK INSERT bronze.routes
		FROM 'D:\Python\routes.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.employees';
		TRUNCATE TABLE bronze.employees;

		PRINT 'Inserting Data Into: bronze.employees';
		BULK INSERT bronze.employees
		FROM 'D:\Python\employees.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.crew';
		TRUNCATE TABLE bronze.crew;

		PRINT 'Inserting Data Into: bronze.crew';
		BULK INSERT bronze.crew
		FROM 'D:\Python\crew.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.payroll';
		TRUNCATE TABLE bronze.payroll;

		PRINT 'Inserting Data Into: bronze.payroll';
		BULK INSERT bronze.payroll
		FROM 'D:\Python\payroll.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.employees_attendance';
		TRUNCATE TABLE bronze.employees_attendance;

		PRINT 'Inserting Data Into: bronze.employees_attendance';
		BULK INSERT bronze.employees_attendance
		FROM 'D:\Python\employees_attendance.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.flight_costs';
		TRUNCATE TABLE bronze.flight_costs;

		PRINT 'Inserting Data Into: bronze.flight_costs';
		BULK INSERT bronze.flight_costs
		FROM 'D:\Python\flight_costs.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.work_orders';
		TRUNCATE TABLE bronze.work_orders;

		PRINT 'Inserting Data Into: bronze.work_orders';
		BULK INSERT bronze.work_orders
		FROM 'D:\Python\work_orders.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.maintenance';
		TRUNCATE TABLE bronze.maintenance;

		PRINT 'Inserting Data Into: bronze.maintenance';
		BULK INSERT bronze.maintenance
		FROM 'D:\Python\maintenance.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.suppliers';
		TRUNCATE TABLE bronze.suppliers;

		PRINT 'Inserting Data Into: bronze.suppliers';
		BULK INSERT bronze.suppliers
		FROM 'D:\Python\suppliers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.maintenance_cost';
		TRUNCATE TABLE bronze.maintenance_cost;

		PRINT 'Inserting Data Into: bronze.maintenance_cost';
		BULK INSERT bronze.maintenance_cost
		FROM 'D:\Python\maintenance_cost.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.flight_hours';
		TRUNCATE TABLE bronze.flight_hours;

		PRINT 'Inserting Data Into: bronze.flight_hours';
		BULK INSERT bronze.flight_hours
		FROM 'D:\Python\flight_hours.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.safety_incidents';
		TRUNCATE TABLE bronze.safety_incidents;

		PRINT 'Inserting Data Into: bronze.safety_incidents';
		BULK INSERT bronze.safety_incidents
		FROM 'D:\Python\safety_incidents.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.compliance_audits';
		TRUNCATE TABLE bronze.compliance_audits;

		PRINT 'Inserting Data Into: bronze.compliance_audits';
		BULK INSERT bronze.compliance_audits
		FROM 'D:\Python\compliance_audits.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.corrective_actions';
		TRUNCATE TABLE bronze.corrective_actions;

		PRINT 'Inserting Data Into: bronze.corrective_actions';
		BULK INSERT bronze.corrective_actions
		FROM 'D:\Python\corrective_actions.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.safety_training';
		TRUNCATE TABLE bronze.safety_training;

		PRINT 'Inserting Data Into: bronze.safety_training';
		BULK INSERT bronze.safety_training
		FROM 'D:\Python\safety_training.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.revenue';
		TRUNCATE TABLE bronze.revenue;

		PRINT 'Inserting Data Into: bronze.revenue';
		BULK INSERT bronze.revenue
		FROM 'D:\Python\revenue.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.flight_costs';
		TRUNCATE TABLE bronze.flight_costs;

		PRINT 'Inserting Data Into: bronze.flight_costs';
		BULK INSERT bronze.flight_costs
		FROM 'D:\Python\flight_costs.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.fuel_price';
		TRUNCATE TABLE bronze.fuel_price;

		PRINT 'Inserting Data Into: bronze.fuel_price';
		BULK INSERT bronze.fuel_price
		FROM 'D:\Python\fuel_price.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.customers';
		TRUNCATE TABLE bronze.customers;

		PRINT 'Inserting Data Into: bronze.customers';
		BULK INSERT bronze.customers
		FROM 'D:\Python\customers.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.membership';
		TRUNCATE TABLE bronze.membership;

		PRINT 'Inserting Data Into: bronze.membership';
		BULK INSERT bronze.membership
		FROM 'D:\Python\membership.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.leads';
		TRUNCATE TABLE bronze.leads;

		PRINT 'Inserting Data Into: bronze.leads';
		BULK INSERT bronze.leads
		FROM 'D:\Python\leads.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.flight_bookings';
		TRUNCATE TABLE bronze.flight_bookings;

		PRINT 'Inserting Data Into: bronze.flight_bookings';
		BULK INSERT bronze.flight_bookings
		FROM 'D:\Python\flight_bookings.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.marketing_campaigns';
		TRUNCATE TABLE bronze.marketing_campaigns;

		PRINT 'Inserting Data Into: bronze.marketing_campaigns';
		BULK INSERT bronze.marketing_campaigns
		FROM 'D:\Python\marketing_campaigns.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.campaign_performance';
		TRUNCATE TABLE bronze.campaign_performance;

		PRINT 'Inserting Data Into: bronze.campaign_performance';
		BULK INSERT bronze.campaign_performance
		FROM 'D:\Python\campaign_performance.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.surveys';
		TRUNCATE TABLE bronze.surveys;

		PRINT 'Inserting Data Into: bronze.surveys';
		BULK INSERT bronze.surveys
		FROM 'D:\Python\surveys.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.service_requests';
		TRUNCATE TABLE bronze.service_requests;

		PRINT 'Inserting Data Into: bronze.service_requests';
		BULK INSERT bronze.service_requests
		FROM 'D:\Python\service_requests.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.concierge_addons';
		TRUNCATE TABLE bronze.concierge_addons;

		PRINT 'Inserting Data Into: bronze.concierge_addons';
		BULK INSERT bronze.concierge_addons
		FROM 'D:\Python\concierge_addons.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.complaints';
		TRUNCATE TABLE bronze.complaints;

		PRINT 'Inserting Data Into: bronze.complaints';
		BULK INSERT bronze.complaints
		FROM 'D:\Python\complaints.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @start_time = GETDATE();
		PRINT 'Truncating Table: bronze.churn_reasons';
		TRUNCATE TABLE bronze.churn_reasons;

		PRINT 'Inserting Data Into: bronze.churn_reasons';
		BULK INSERT bronze.churn_reasons
		FROM 'D:\Python\churn_reasons.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'seconds';
		PRINT '--------------------------------------------';

		SET @batch_end_time = GETDATE();
		PRINT 'Bronze layer load duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'seconds';
		PRINT '-----------------------------------------------------';
	END TRY
	BEGIN CATCH
			PRINT '=================================================';
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
			PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
			PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
			PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS NVARCHAR);
	END CATCH
END
