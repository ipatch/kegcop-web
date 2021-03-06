//d3.select("body").append("svg").attr("width", 50).attr("height", 50).append("circle").attr("cx", 25).attr("cy", 25).attr("r", 25).style("fill", "purple");

// var bodySelection = d3.select("body");

// var svgSelection = bodySelection.append("svg")
// 	.attr("width", 50)
// 	.attr("width", 50);

// var circleSelection = svgSelection.append("circle")
// 	.attr("cx", 25)
// 	.attr("cy", 25)
// 	.attr("r", 25)
// 	.style("fill", "purple");

w = window.innerWidth,
h = window.innerHeight;
    
    var svg = d3.select("body").append("svg:svg")
        .attr("width", w)
        .attr("height", h);
    
    var circle = svg.selectAll("circle")
        .data(d3.range(70).map(function(datum,interval) {
          return {
            x: interval*20,
            y: 0,
            // stroke-width="1",
            dx: 5,
            dy: -3 * (Math.random()+1),
            mu: Math.random()*2
          };
        }))
      .enter().append("svg:circle")
        .attr("r", 2.5)
        .attr("fill","#FFEFA0") // fill
        .attr("stroke","white") // stroke
       .attr("stroke-width", "1")
        // .attr("opacity",".0.2")
        .style("stroke-opacity", "1.0")
        .style("fill-opacity", ".5");
    
    var text = svg.append("svg:text")
        .attr("x", 20)
        .attr("y", 20);
    
    var start = Date.now(),
        frames = 0;
    
    d3.timer(function() 
    {
    
      // Update the FPS meter.
      // var now = Date.now(), duration = now - start;
      // text.text(~~(++frames * 1000 / duration));
      // if (duration >= 1000) frames = 0, start = now;
    
      // Update the circle positions.
      circle
          .attr("cx", function(d) { d.x += Math.random()*3*Math.sin(Math.random()*3*d.x + Math.random()*10); if (d.x > w) d.x -= w; else if (d.x < 0) d.x += w; return d.x; })
          .attr("cy", function(d) { d.y += d.dy ; if (d.y > h) d.y -= h; else if (d.y < 0) d.y += h; return d.y; })
          .attr("r",function(d)
          {
            return (d.y < 100) ? d3.select(this).attr("r") : d.mu*500/d.y;
          });
    });


// var bubblesDivWidth = window.innerWidth;
// var bubblesDivHeight = window.innerHeight;
// var bDH1 = window.innerHeight + 1;
// var bStartY = (bDH1 - bubblesDivHeight);

// circleRadius = [],

// i = 0

// for (i=0; i<50; i++){ // second value = # of circles
//    circleRadius.push(Math.round(Math.random()*100));
// }

// var svgContainer = d3.select("#bubbles").append("svg")
// .attr("width", bubblesDivWidth)
// .attr("height", bubblesDivHeight);

// var circles = svgContainer.selectAll("circle")
//    .data(circleRadius)
//    .enter()
//    .append("circle")

// var circleAttributes = circles
// .attr("cx", function(d, i){return i*80})
// .attr("cy", bubblesDivHeight)// starting point for bubbles
// .attr("r", Math.random() * 12 + 4) // works better than below line.
// //.attr("r", function(d, i){return i*Math.random()*2})
// .style("fill", "white")
// .style("fill-opacity", "0.2")
// .style("stroke", "white")
// .style("stroke-opacity", "0.4")
