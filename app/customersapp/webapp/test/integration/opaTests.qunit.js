sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectportfolio/customersapp/test/integration/FirstJourney',
		'projectportfolio/customersapp/test/integration/pages/CustomersList',
		'projectportfolio/customersapp/test/integration/pages/CustomersObjectPage',
		'projectportfolio/customersapp/test/integration/pages/ProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage, ProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectportfolio/customersapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage,
					onTheProjectsObjectPage: ProjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);