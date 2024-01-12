sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectportofolio/customeranalyticsapp/test/integration/FirstJourney',
		'projectportofolio/customeranalyticsapp/test/integration/pages/CustomersList',
		'projectportofolio/customeranalyticsapp/test/integration/pages/CustomersObjectPage'
    ],
    function(JourneyRunner, opaJourney, CustomersList, CustomersObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectportofolio/customeranalyticsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCustomersList: CustomersList,
					onTheCustomersObjectPage: CustomersObjectPage
                }
            },
            opaJourney.run
        );
    }
);