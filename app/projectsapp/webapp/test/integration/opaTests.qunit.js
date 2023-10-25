sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'projectportfolio/projectsapp/test/integration/FirstJourney',
		'projectportfolio/projectsapp/test/integration/pages/ProjectsList',
		'projectportfolio/projectsapp/test/integration/pages/ProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('projectportfolio/projectsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);