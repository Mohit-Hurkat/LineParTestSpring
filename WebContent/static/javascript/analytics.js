/* Pie chart based on the pen by aaronlsilber (http://codepen.io/aaronlsilber/pen/IqrkL) which is based on an article by James Litten (http://html5.litten.com/graphing-data-in-the-html5-canvas-element-part-iv-simple-pie-charts/) */

/* Pie Chart Javascript
=====================================================================*/
window.onload = function() {
//var pieColors = [
//    'rgb(236, 208, 120)',
//    'rgba(217, 91, 67, 0.7)',
//    'rgba(192, 41, 66, 0.7)',
//    'rgba(84, 36, 55, 0.7)',
//    'rgba(83, 119, 122, 0.7)',
//    'rgba(119, 146, 174, 0.7)'
//];
//
//function drawPieChart(canvas) {
//    var ctx = canvas.getContext('2d'),
//        halfWidth = canvas.width / 2,
//        halfHeight = canvas.height / 2;
//
//    var pieData = canvas.dataset.values.split(',').map(function (x) {
//            return x << 0;
//        }),
//        lastend = 0;
//
//    for (var i = 0, myTotal = 0; i < pieData.length; myTotal += pieData[i++]);
//
//    ctx.clearRect(0, 0, canvas.width, canvas.height);
//
//    for (var i = 0; i < pieData.length; i++) {
//        ctx.fillStyle = pieColors[i];
//        ctx.beginPath();
//        ctx.moveTo(halfWidth, halfHeight);
//        ctx.arc(halfWidth, halfHeight, halfHeight, lastend, lastend + (Math.PI * 2 * (pieData[i] / myTotal)), false);
//        ctx.lineTo(halfWidth, halfHeight);
//        ctx.fill();
//        lastend += Math.PI * 2 * (pieData[i] / myTotal);
//    }
//}
//
//drawPieChart(document.querySelector('#canPie'));



/* Peak Chart Javascript
=====================================================================*/
var peakColors = ['rgba(236, 208, 120, 0.7)', 'rgba(217, 91, 67, 0.7)', 'rgba(192, 41, 66, 0.7)', 'rgba(84, 36, 55, 0.7)', 'rgba(83, 119, 122, 0.7)', 'rgba(119, 146, 174, 0.7)','rgba(128, 255, 0, 0.7)','rgba(230, 25, 25, 0.7)','rgba(0, 174, 255, 0.7)','rgba(232, 16, 120, 0.7)','rgba(255, 255, 255,0.7)','rgba(255, 255, 255,0)'];

function drawPeakChart(canvas) {
    var ctx = canvas.getContext('2d'),
        peakData = canvas.dataset.values.split(',').map(function (x) {
            return x << 0;
        }),
        max = Math.max.apply(Math, peakData),
        plotBase = canvas.width / peakData.length,
        overlap = plotBase * 0.4;

    plotBase += canvas.width * 0.05;

    ctx.clearRect(0, 0, canvas.width, canvas.height);

    for (var i = 0; i < peakData.length; i++) {
        var start = !i ? 0 : i * plotBase - i * overlap;
        var peakPoint = canvas.height - Math.round(canvas.height * (peakData[i] / max));
        ctx.fillStyle = peakColors[i];
        ctx.beginPath();
        ctx.moveTo(start, canvas.height);
        ctx.lineTo(start + plotBase / 2, peakPoint);
        ctx.lineTo(start + plotBase, canvas.height);
        ctx.lineTo(start, canvas.height);
        ctx.fill();
    }
}

drawPeakChart(document.querySelector('#canPeak'));




 
 







var peakColors = ['rgba(255, 255, 255,0.7)','rgba(236, 208, 120)','rgba(232, 16, 120, 0.7)','rgba(0, 174, 255, 0.7)','rgba(230, 25, 25, 0.7)', 'rgba(128, 255, 0, 0.7)', 'rgba(119, 146, 174, 0.7)', 'rgba(83, 119, 122, 0.7)','rgba(84, 36, 55, 0.7)', 'rgba(192, 41, 66, 0.7)', 'rgba(217, 91, 67, 0.7)','rgba(255, 255, 255,0)'];

function drawPeakChart2(canvas) {
    var ctx = canvas.getContext('2d'),
        peakData = canvas.dataset.values.split(',').map(function (x) {
            return x << 0;
        }),
        max = Math.max.apply(Math, peakData),
        plotBase = canvas.width / peakData.length,
        overlap = plotBase * 0.4;

    plotBase += canvas.width * 0.05;

    ctx.clearRect(0, 0, canvas.width, canvas.height);

    for (var i = 0; i < peakData.length; i++) {
        var start = !i ? 0 : i * plotBase - i * overlap;
        var peakPoint = canvas.height - Math.round(canvas.height * (peakData[i] / max));
        ctx.fillStyle = peakColors[i];
        ctx.beginPath();
        ctx.moveTo(start, canvas.height);
        ctx.lineTo(start + plotBase / 2, peakPoint);
        ctx.lineTo(start + plotBase, canvas.height);
        ctx.lineTo(start, canvas.height);
        ctx.fill();
    }
}

drawPeakChart2(document.querySelector('#canPeak2'));

/* Bar Chart Javascript
=====================================================================*/
//var barColors = ['rgb(236, 208, 120)', 'rgba(217, 91, 67, 0.7)', 'rgba(192, 41, 66, 0.7)', 'rgba(84, 36, 55, 0.7)', 'rgba(83, 119, 122, 0.7)', 'rgba(119, 146, 174, 0.7)'];
//
//function drawBarChart(canvas) {
//    var ctx = canvas.getContext('2d');
//
//    var barData = canvas.dataset.values.split(',').map(function (x) {
//            return x << 0;
//        }),        
//        max = Math.max.apply(Math, barData),
//        padding = 20,
//        plotWidth = canvas.width / barData.length - padding;
//
//    ctx.clearRect(0, 0, canvas.width, canvas.height);
//
//    for (var i = 0; i < barData.length; i++) {
//        var start = !i ? 0 : i * (plotWidth + padding);
//        var top = canvas.height - Math.round(canvas.height * (barData[i] / max));
//        ctx.fillStyle = peakColors[i];
//        ctx.fillRect(start, top, plotWidth, canvas.height - top);
//    }
//}
//
//drawBarChart(document.querySelector('#canBar'));
}