using { projectportfolio.db as db } from '../db/schema';

service ProjectsService @(requires: 'User') {

    entity Projects as projection on db.Projects actions {
        function hasStarted() returns Boolean;
        function hasEnded() returns Boolean;
        action stop(endDate : Date);
    };
    function isStarted(project: Projects:ID) returns Boolean;
    action endProject(project: Projects:ID); 
    @readonly entity Customers as projection on db.Customers;

}