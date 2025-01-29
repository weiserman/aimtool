sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'pnp/application/test/integration/FirstJourney',
		'pnp/application/test/integration/pages/InboundEmailList',
		'pnp/application/test/integration/pages/InboundEmailObjectPage'
    ],
    function(JourneyRunner, opaJourney, InboundEmailList, InboundEmailObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('pnp/application') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInboundEmailList: InboundEmailList,
					onTheInboundEmailObjectPage: InboundEmailObjectPage
                }
            },
            opaJourney.run
        );
    }
);