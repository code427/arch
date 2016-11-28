
	var list;
	var pageItem=15;
	var totalPage;
	window.onload = function() {
		
		list = document.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
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
