using { projectportfolio.db as db } from '../db/schema';

service CustomersService @(requires: 'CustomerAdmin') {

    entity Customers as projection on db.Customers;
    @readonly entity Projects as projection on db.Projects;

}