// Morris.js Charts sample data for SB Admin template

$(function() {

    // Donut Chart
    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    // Bar Chart
	Morris.Bar({
	  element: 'morris-bar-chart',
	  data: [
		{ y: '2006', a: 100,  },
		{ y: '2007', a: 75,  },
		{ y: '2008', a: 50,  },
		{ y: '2009', a: 75,  },
		{ y: '2010', a: 50,  },
		{ y: '2011', a: 75,  },
		{ y: '2012', a: 100, }
	  ],
	  xkey: 'y',
	  ykeys: ['a', 'b'],
	  labels: ['Series A']
	});


});
