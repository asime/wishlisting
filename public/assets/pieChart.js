function PieChart(a,b){this.includeLabels=!1,b.includeLabels==undefined?this.includeLabels=!1:this.includeLabels=b.includeLabels,this.data=b.data?b.data:[30,70,45,65,20,130],this.labels=b.labels?b.labels:["First","Second","Third","Fourth","Fifth","Sixth"],this.colors=b.colors?b.colors:[["#bbddb3","#1d8e04"],["#e2f5b4","#9edd08"],["#fdfbb4","#faf406"],["#fbd4b7","#f2700f"],["#f8bdb4","#ea2507"],["#e2bcbd","#9e2126"]],this.canvas=document.getElementById(a)}PieChart.prototype={select:function(a){var b=this,c=this.canvas.getContext("2d");this.drawSegment(this.canvas,c,a,this.data[a],!0,this.includeLabels)},draw:function(){var a=this,b=this.canvas.getContext("2d");for(var c=0;c<this.data.length;c++)this.drawSegment(this.canvas,b,c,this.data[c],!1,this.includeLabels)},drawSegment:function(a,b,c,d,e,f){var g=this;b.save();var h=Math.floor(a.width/2),i=Math.floor(a.height/2);radius=Math.floor(a.width/2);var j=g.degreesToRadians(g.sumTo(g.data,c)),k=g.degreesToRadians(d),l=j+k;b.beginPath(),b.moveTo(h,i),b.arc(h,i,radius,j,l,!1),b.closePath(),e?b.fillStyle=g.colors[c][1]:b.fillStyle=g.colors[c][0],b.fill(),b.restore(),f&&g.labels.length>c&&g.drawSegmentLabel(a,b,c,e)},drawSegmentLabel:function(a,b,c,d){var e=this;b.save();var f=Math.floor(a.width/2),g=Math.floor(a.height/2),h=e.degreesToRadians(e.sumTo(e.data,c));b.translate(f,g),b.rotate(h),b.textAlign="right";var i=Math.floor(a.height/25);b.font=i+"pt Helvetica";var j=Math.floor(a.width*.5)-10,k=Math.floor(a.height*.05);b.fillText(e.labels[c],j,k),b.restore()},drawLabel:function(a){var b=this,c=this.canvas.getContext("2d"),d=b.data[a];b.drawSegmentLabel(this.canvas,c,a,d,!1)},degreesToRadians:function(a){return a*Math.PI/180},sumTo:function(a,b){var c=0;for(var d=0;d<b;d++)c+=a[d];return c}};