sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectportofolio/customersapp/test/integration/FirstJourney',
		'projectportofolio/customersapp/test/integration/pages/CustomersList',
		'projectportofolio/customersapp/test/integration/pages/CustomersObjectPage',
		'projectportofolio/customersapp/test/integration/pages/ProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage, ProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectportofolio/customersapp') + '/index.html'
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