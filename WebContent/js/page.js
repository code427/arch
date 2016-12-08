
var list;
var pageItem=15;
var totalPage;
window.onload = function() {

	list = document.getElementsByTagName("Tbody")[0].getElementsByTagName("tr");
	
	if(list.length>pageItem){
		for(k=pageItem;k<list.length;k++){
			list[k].style.display="none";
		}			
	}
	
	totalPage = Math.ceil(list.length/pageItem);
	if (totalPage > 0 ) {
		var pageNav = document.getElementById("pageNav");
		
		// < 
		var newPage = document.createElement("a");	
		newPage.setAttribute("href","#");
		newPage.onclick=function(){
			var activePageNum=document.getElementsByClassName("activePage")[0].innerHTML;
			displayPage(Math.max(activePageNum-1,1));
		}
		
		var pageNumber = document.createTextNode("<");
		newPage.appendChild(pageNumber);
		pageNav.appendChild(newPage);

		
		for (i = 1; i <= totalPage; i++) {
			
			
			var newPage = document.createElement("a");	
			newPage.setAttribute("href","#");
			
			var pageNumber = document.createTextNode(i);
			newPage.appendChild(pageNumber);
			
			
			newPage.onclick=function(){
				displayPage(this.innerHTML);
				
			}
			pageNav.appendChild(newPage);
		}
		
		//> 
		var newPage = document.createElement("a");	
		newPage.setAttribute("href","#");
		newPage.onclick=function(){
			var activePageNum=document.getElementsByClassName("activePage")[0].innerHTML;
			displayPage(Math.min(parseInt(activePageNum,10)+1,totalPage));
		}
		var pageNumber = document.createTextNode(">");
		newPage.appendChild(pageNumber);
		pageNav.appendChild(newPage);

	}
	
	//add onclick function	
	displayPage(1);
	// form chart
	drawChart('formChart','formTbody');
	drawChart('typeChart','typeTbody');
		
	   	chartDiv.style.display="none";
	   	typeTable.style.display="none";
	   		
	}


function drawChart(chart,tbody){
	var formArray=[];
	var count=[];
	var chartDiv=document.getElementById("chartDiv");
	var formChart=document.getElementById(chart);
	
	var Formlist = document.getElementById(tbody).getElementsByTagName("tr");

	
	for (var i = 0; i < Formlist.length; i++) {
	   var fm= Formlist[i].getElementsByTagName("td")[1].getElementsByTagName("a")[0].innerHTML;
	    if(formArray.indexOf(fm)==-1){
	    	formArray.push(fm);
	    	count.push(1);
	    }
	    else {
	    	count[formArray.indexOf(fm)]++;
	    	
	    }
	    
	}
	   for(i=0;i<formArray.length;i++){
		 var newDiv=document.createElement("div");
		 var textnode = document.createTextNode(formArray[i]); 
		 newDiv.appendChild(textnode);
		 newDiv.style.width=count[i]/list.length*80+"vw";
		 formChart.appendChild(newDiv);  
	   }
}

var typeTableSwitch=0;
function showType(){
	var typeTable=document.getElementById("typeTable");
	
	if(typeTableSwitch==0){
		typeTable.style.display="table";
		formTable.style.display="none";

		typeTableSwitch=1;
	}
	else {
		typeTable.style.display="none";
		formTable.style.display="table";

		typeTableSwitch=0;
	}
}

var formTableSwitch=1;
function showForm(){
	var formTable=document.getElementById("formTable");
	
	if(formTableSwitch==0){
		formTable.style.display="table";
		formTableSwitch=1;
	}
	else {
		formTable.style.display="none";
		formTableSwitch=0;
	}   	
}



function displayPage(page){		
		for(r = 0;r<list.length;r++){
			list[r].style.display="none";
		}
		for(s=(page-1)*pageItem;s<page*pageItem&&s<list.length;s++){
			list[s].style.display = "table-row";				
		}
		
		var pageNav = document.getElementById("pageNav");
		var ia = pageNav.getElementsByTagName("a");
		for (l=0;l<ia.length;l++){
			ia[l].removeAttribute("class");
			ia[l].style.display='none';
		}
		
		ia[page].setAttribute("class","activePage");

		//display < >
		ia[0].style.display='inline';
		ia[ia.length-1].style.display='inline';
		var displayed=0;
		for (d=page-9;d<ia.length-1;d++){
			if(d<=0) continue;
			if(displayed>9) break;
			ia[d].style.display='inline';
			displayed++;
		}
		
}

var charSwitch=0;
function report(){
	var tableDiv=document.getElementById("tableDiv");
	tableDiv.style.display="none";

	var chartDiv=document.getElementById("chartDiv");

	if(charSwitch==0){
	
		chartDiv.style.display="block";
		tableDiv.style.display="none";
		charSwitch=1;
		
	}
	else {			
		chartDiv.style.display="none";
		tableDiv.style.display="block";
		charSwitch=0;							
	}
}

function search(){
	list = document.getElementsByTagName("Tbody")[0].getElementsByTagName("tr");
	for(r = 0;list.length;r++){
		if(list[r].getElementsByTagName("td")[0].getElementsByTagName("a")[0].innerHTML==document.getElementById("ctid").value){
			
			continue;
		}
		else list[r].style.display="none";;
	}
	
}