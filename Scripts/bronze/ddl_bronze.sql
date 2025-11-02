/*
=============================================================================================================
DDL Script: Create Bronze Tables
    Script Purpose:
        This script creates tables in the 'bronze' schema, dropping existing tables if they already exist.
        Run this script to re-define the DDL structure of 'bronze' tables.
=============================================================================================================
*/

-- Create table aircraft
IF OBJECT_ID('bronze.aircraft', 'U') IS NOT NULL
	DROP TABLE bronze.aircraft;

GO

CREATE TABLE bronze.aircraft(
	aircraft_id NVARCHAR(100),
	tail_number NVARCHAR(100),
	aircraft_name NVARCHAR(100),
	aircraft_type NVARCHAR(100),
	manufacturer NVARCHAR(100),
	year_of_manufacture NVARCHAR(100),
	in_service_date NVARCHAR(100),
	aircraft_status NVARCHAR(100),
	range_km NVARCHAR(100),
	seats NVARCHAR(100),
	sleeping_capacity NVARCHAR(100),
	fuel_burn_ltr NVARCHAR(100),
	acquisition_cost NVARCHAR(100)
);

GO

-- Create table flights
IF OBJECT_ID('bronze.flights', 'U') IS NOT NULL
	DROP TABLE bronze.flights;

GO

CREATE TABLE bronze.flights (
	flight_id NVARCHAR(100),
	aircraft_id NVARCHAR(100),
	route_id NVARCHAR(100),
	scheduled_depature NVARCHAR(100),
	actual_depature NVARCHAR(100),
	scheduled_arrival NVARCHAR(100),
	actual_arrival NVARCHAR(100),
	block_out_time NVARCHAR(100),
	block_in_time NVARCHAR(100),
	flight_status NVARCHAR(50),
	delay_reason NVARCHAR(255),
	crew_id NVARCHAR(100),
	gate_number_out NVARCHAR(10),
	gate_number_in NVARCHAR(10),
	created_at NVARCHAR(100)
);

GO

-- Create table airports
IF OBJECT_ID('bronze.airports', 'U') IS NOT NULL
	DROP TABLE bronze.airports;

GO

CREATE TABLE bronze.airports (
	airport_id NVARCHAR(100),
	iata_code NVARCHAR(10),
	icao_code NVARCHAR(10),
	airport_name NVARCHAR(100),
	city NVARCHAR(50),
	country NVARCHAR(50),
	latitude NVARCHAR(100),
	longitude NVARCHAR(100),
	elevation_ft NVARCHAR(100),
	timezone NVARCHAR(30),
	longest_runway_m NVARCHAR(100),
	is_business_aviation_hub NVARCHAR(10),
	website NVARCHAR(255),
	notes NVARCHAR(255)
);

GO

-- Create table routes
IF OBJECT_ID('bronze.routes', 'U') IS NOT NULL
	DROP TABLE bronze.routes;

GO

CREATE TABLE bronze.routes (
	route_id NVARCHAR(100),
	original_airport_id NVARCHAR(100),
	destination_airport_id NVARCHAR(100),
	distance_nm NVARCHAR(100),
	avg_block_time_min NVARCHAR(100),
	route_category NVARCHAR(20),
	is_active NVARCHAR(100)
);

GO


-- Create table employees
IF OBJECT_ID('bronze.employees', 'U') IS NOT NULL
	DROP TABLE bronze.employees;

GO

CREATE TABLE bronze.employees (
	employee_id NVARCHAR(100),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	job_title NVARCHAR(50),
	department NVARCHAR(50),
	basic_salary_annual_usd NVARCHAR(100),
	hourly_rate_usd NVARCHAR(100),
	house_allowance_usd NVARCHAR(100),
	transport_allowance_usd NVARCHAR(100),
	hire_date NVARCHAR(100),
	termination_date NVARCHAR(100),
	employee_status NVARCHAR(20),
	licence_number NVARCHAR(50),
	pension_number NVARCHAR(50),
	tax_number NVARCHAR(50),
	health_insuarance NVARCHAR(50),
	bank_name NVARCHAR(50),
	bank_account NVARCHAR(100),
	nationality NVARCHAR(50),
	date_of_birth NVARCHAR(100)
);

GO

--Create table crew
IF OBJECT_ID('bronze.crew', 'U') IS NOT NULL
	DROP TABLE bronze.crew;

GO

CREATE TABLE bronze.crew (
	crew_id NVARCHAR(100),
	flight_id NVARCHAR(100),
	employee_id NVARCHAR(100),
	duty_role NVARCHAR(50),
	duty_start NVARCHAR(100),
	duty_end NVARCHAR(100),
	created_at NVARCHAR(100),
	updated_at NVARCHAR(100)
);

GO

--Create Payroll table
IF OBJECT_ID('bronze.payroll', 'U') IS NOT NULL
	DROP TABLE bronze.payroll;

GO

CREATE TABLE bronze.payroll (
	payroll_id NVARCHAR(100),
	employee_id NVARCHAR(100),
	period_start NVARCHAR(100),
	period_end NVARCHAR(100),
	pay_date NVARCHAR(100),
	paye_tax NVARCHAR(100),
	pension NVARCHAR(100),
	salary_advance NVARCHAR(100),
	union_dues NVARCHAR(100)
);

GO

-- Create table employee attendance
IF OBJECT_ID('bronze.employees_attendance', 'U') IS NOT NULL
	DROP TABLE bronze.employees_attendance;

GO

CREATE TABLE bronze.employees_attendance (
	attendance_id NVARCHAR(100),
	employee_id NVARCHAR(100),
	crew_id NVARCHAR(100),
	shift_date NVARCHAR(100),
	check_in NVARCHAR(100),
	check_out NVARCHAR(100),
	duty_hours NVARCHAR(100),
	overtime_hours NVARCHAR(100),
	attendance_status NVARCHAR(20),
	remarks NVARCHAR(20),
	created_at NVARCHAR(100),
	updated_at NVARCHAR(100)
);

GO

-- Create table flight costs
IF OBJECT_ID('bronze.flight_costs', 'U') IS NOT NULL
	DROP TABLE bronze.flight_costs;

GO

CREATE TABLE bronze.flight_costs (
	cost_id NVARCHAR(100),
	flight_id NVARCHAR(100),
	fuel_cost NVARCHAR(100),
	crew_cost NVARCHAR(100),
	airport_fees NVARCHAR(100),
	maintenance_cost NVARCHAR(100),
	created_at NVARCHAR(100),
	total_cost NVARCHAR(100)
);

GO

-- Create table work orders
IF OBJECT_ID('bronze.work_orders', 'U') IS NOT NULL
	DROP TABLE bronze.work_orders;

GO

CREATE TABLE bronze.work_orders(
	work_order_id NVARCHAR(100),
	aircraft_id NVARCHAR(100),
	order_date NVARCHAR(100),
	completion_date NVARCHAR(100),
	priority NVARCHAR(20),
	status NVARCHAR(20),
	raised_by NVARCHAR(100),
	approved_by NVARCHAR(100)
);

GO

-- Create table maintenance
IF OBJECT_ID('bronze.maintenance', 'U') IS NOT NULL
	DROP TABLE bronze.maintenance;

GO

CREATE TABLE bronze.maintenance(
	maintenance_id NVARCHAR(100), 
	aircraft_id NVARCHAR(100), 
	work_order_id NVARCHAR(100), 
	task_code NVARCHAR(50), 
	description NVARCHAR(255),
    maintenance_type NVARCHAR(50), 
	performed_by_emp_id NVARCHAR(100), 
	start_date NVARCHAR(100), 
	end_date NVARCHAR(100), 
	status NVARCHAR(20), 
	remarks NVARCHAR(255)
);

GO

-- Create table suppliers
IF OBJECT_ID('bronze.suppliers', 'U') IS NOT NULL
	DROP TABLE bronze.suppliers;

GO

CREATE TABLE bronze.suppliers (
    supplier_id NVARCHAR(100),
    supplier_name NVARCHAR(150),
    contact_name NVARCHAR(100),
    contact_email NVARCHAR(150),
    contact_phone NVARCHAR(50),
    address NVARCHAR(255),
    city NVARCHAR(100),
    country NVARCHAR(100),
    certification_no NVARCHAR(50),
    approved_status NVARCHAR(50),
    supplier_type NVARCHAR(100),
    payment_terms NVARCHAR(50)
);

GO

-- Create table maintenance cost table
IF OBJECT_ID('bronze.maintenance_cost', 'U') IS NOT NULL
	DROP TABLE bronze.maintenance_cost;

GO

CREATE TABLE bronze.maintenance_cost (
    cost_id NVARCHAR(100),
    maintenance_id NVARCHAR(100),
    work_order_id NVARCHAR(100),
    supplier_id NVARCHAR(100),
    labor_cost NVARCHAR(100),
    parts_cost NVARCHAR(100),
    downtime_cost NVARCHAR(100),  
    payment_status NVARCHAR(20),
    invoice_number NVARCHAR(50),
    payment_date NVARCHAR(100),
    created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);

GO

-- Create table flight hours table
IF OBJECT_ID('bronze.flight_hours', 'U') IS NOT NULL
	DROP TABLE bronze.flight_hours;

GO

CREATE TABLE bronze.flight_hours (
    flight_hours_id NVARCHAR(100),
    aircraft_id NVARCHAR(100),
    date_recorded NVARCHAR(100),
    flight_hours NVARCHAR(100),
    block_hours NVARCHAR(100),
    flight_cycles NVARCHAR(100),
    cumulative_flight_hours NVARCHAR(100),
    cumulative_cycles NVARCHAR(100),
    cost_per_block_hour NVARCHAR(100),
    mtbf_hours NVARCHAR(100),
    data_source NVARCHAR(50),
    remarks NVARCHAR(255),
);

GO

-- Create table safety incidents table
IF OBJECT_ID('bronze.safety_incidents', 'U') IS NOT NULL
	DROP TABLE bronze.safety_incidents;

GO

CREATE TABLE bronze.safety_incidents (
    incident_id NVARCHAR(100),              
    aircraft_id NVARCHAR(100),                               
    incident_date NVARCHAR(100),                       
    incident_type NVARCHAR(100),                            
    severity_level NVARCHAR(20),                            
    description NVARCHAR(500),                              
    reported_by NVARCHAR(100),                              
    resolution_status NVARCHAR(50),                         
    reported_date NVARCHAR(100),                                
    created_at NVARCHAR(100),              
    updated_at NVARCHAR(100)
);

GO

-- Create table compliance audits table
IF OBJECT_ID('bronze.compliance_audits', 'U') IS NOT NULL
	DROP TABLE bronze.compliance_audits;

GO

CREATE TABLE bronze.compliance_audits (
    audit_id NVARCHAR(100),
    audit_date NVARCHAR(100),
    audit_type NVARCHAR(50),
    auditor_name NVARCHAR(100),
    findings_count NVARCHAR(100),
    compliance_status NVARCHAR(30),
    aircraft_id NVARCHAR(100),
    corrective_action_status NVARCHAR(50),
    next_audit_date NVARCHAR(100),
    remarks NVARCHAR(255),
    created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);

GO

-- Create table corrective actions table
IF OBJECT_ID('bronze.corrective_actions', 'U') IS NOT NULL
	DROP TABLE bronze.corrective_actions;

GO

CREATE TABLE bronze.corrective_actions (
    action_id NVARCHAR(100),
    audit_id NVARCHAR(100),
    incident_id NVARCHAR(100),
    action_description NVARCHAR(500),
    responsible_team NVARCHAR(100),
    due_date NVARCHAR(100),
    completion_date NVARCHAR(100),
    status NVARCHAR(50),
    remarks NVARCHAR(255),
    created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);


GO

-- Create table safety training table
IF OBJECT_ID('bronze.safety_training', 'U') IS NOT NULL
	DROP TABLE bronze.safety_training;

GO

CREATE TABLE bronze.safety_training (
    training_id NVARCHAR(100),
    employee_id NVARCHAR(100),
    training_type VARCHAR(100),
    training_date NVARCHAR(100),
    expiry_date NVARCHAR(100),
    status VARCHAR(50),
	created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);

GO

-- Create table revenue table
IF OBJECT_ID('bronze.revenue', 'U') IS NOT NULL
	DROP TABLE bronze.revenue;

GO

CREATE TABLE bronze.revenue (
    revenue_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    ticket_revenue NVARCHAR(100),
    cargo_revenue NVARCHAR(100),
    membership_revenue NVARCHAR(100),
    created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);

GO

-- Create table flight cost table
IF OBJECT_ID('bronze.flight_costs', 'U') IS NOT NULL
	DROP TABLE bronze.flight_costs;

GO

CREATE TABLE bronze.flight_costs (
    cost_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    fuel_cost NVARCHAR(100),
	crew_cost NVARCHAR(100),
    airport_fee NVARCHAR(100),
    maintenance_cost NVARCHAR(100),
    created_at NVARCHAR(100),
    total_cost NVARCHAR(100)
);

GO

-- Create table fuel price table
IF OBJECT_ID('bronze.fuel_price', 'U') IS NOT NULL
	DROP TABLE bronze.fuel_price;

GO

CREATE TABLE bronze.fuel_price (
    fuel_price_id NVARCHAR(100),
    airport_id NVARCHAR(100),
    supplier_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    purchase_date NVARCHAR(100),
    price_per_gallon NVARCHAR(100),
    quantity NVARCHAR(100),
    created_at NVARCHAR(100),
    updated_at NVARCHAR(100)
);

GO

-- Create table customers table
IF OBJECT_ID('bronze.customers', 'U') IS NOT NULL
	DROP TABLE bronze.customers;

GO

CREATE TABLE bronze.customers (
    customer_id NVARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    customer_type VARCHAR(50),
    country VARCHAR(100),
    join_date NVARCHAR(100)
);

GO

-- Create table membership
IF OBJECT_ID('bronze.membership', 'U') IS NOT NULL
	DROP TABLE bronze.membership;

GO

CREATE TABLE bronze.membership (
    membership_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    membership_type VARCHAR(100),
    start_date NVARCHAR(100),
    end_date NVARCHAR(100),
    membership_status VARCHAR(50)
);

GO

-- Create table leads
IF OBJECT_ID('bronze.leads', 'U') IS NOT NULL
	DROP TABLE bronze.leads;

GO

CREATE TABLE bronze.leads (
    lead_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    source VARCHAR(100),
    lead_status VARCHAR(50),
    created_date NVARCHAR(100)
);

GO

-- Create table flight bookings
IF OBJECT_ID('bronze.flight_bookings', 'U') IS NOT NULL
	DROP TABLE bronze.flight_bookings;

GO

CREATE TABLE bronze.flight_bookings (
    booking_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    booking_date NVARCHAR(100),
    spend_amount NVARCHAR(100),
    status VARCHAR(50)
);

GO

-- Create table market campaign
IF OBJECT_ID('bronze.marketing_campaigns', 'U') IS NOT NULL
	DROP TABLE bronze.marketing_campaigns;

GO

CREATE TABLE bronze.marketing_campaigns (
    campaign_id NVARCHAR(100),
    campaign_type VARCHAR(50),
    start_date NVARCHAR(100),
    end_date NVARCHAR(100),
    budget NVARCHAR(100),
    conversion_rate NVARCHAR(100)
);

GO

-- Create table campaign performance
IF OBJECT_ID('bronze.campaign_performance', 'U') IS NOT NULL
	DROP TABLE bronze.campaign_performance;

GO

CREATE TABLE bronze.campaign_performance (
    performance_id NVARCHAR(100),
    campaign_id NVARCHAR(100),
    impressions NVARCHAR(100),
    clicks NVARCHAR(100),
    leads_generated NVARCHAR(100),
    conversions NVARCHAR(100)
);

GO

-- Create table surveys
IF OBJECT_ID('bronze.surveys', 'U') IS NOT NULL
	DROP TABLE bronze.surveys;

GO

CREATE TABLE bronze.surveys (
    survey_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    nps_score NVARCHAR(100),
    satisfaction_score NVARCHAR(100),
    comments VARCHAR(500),
    survey_date NVARCHAR(100)
);

GO

-- Create table service_requests
IF OBJECT_ID('bronze.service_requests', 'U') IS NOT NULL
	DROP TABLE bronze.service_requests;

GO

CREATE TABLE bronze.service_requests (
    request_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    request_type VARCHAR(100),
    request_date NVARCHAR(100),
    response_time NVARCHAR(100),
    status VARCHAR(50)
);

GO

-- Create table concierge AddOn
IF OBJECT_ID('bronze.concierge_addons', 'U') IS NOT NULL
	DROP TABLE bronze.concierge_addons;

GO

CREATE TABLE bronze.concierge_addons (
    addOn_ID NVARCHAR(100),
    request_id NVARCHAR(100),
    addOn_type VARCHAR(100),
    quantity NVARCHAR(100),
    cost NVARCHAR(100)
);

GO

-- Create table complaints
IF OBJECT_ID('bronze.complaints', 'U') IS NOT NULL
	DROP TABLE bronze.complaints;

GO

CREATE TABLE bronze.complaints (
    complaint_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    flight_id NVARCHAR(100),
    issue_type VARCHAR(100),
    complaint_date NVARCHAR(100),
    resolution_time NVARCHAR(100),
    status VARCHAR(50)
);

GO

-- Create table churn reason
IF OBJECT_ID('bronze.churn_reasons', 'U') IS NOT NULL
	DROP TABLE bronze.churn_reasons;

GO

CREATE TABLE bronze.churn_reasons (
    churn_id NVARCHAR(100),
    customer_id NVARCHAR(100),
    reason VARCHAR(100),
    churn_date NVARCHAR(100)
);
