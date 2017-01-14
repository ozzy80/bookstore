<%@include file="/WEB-INF/pages/template/header.jsp" %>

   <!-- Main -->
   <div id="main" class="shell row" ng-controller="bookController">
      <!-- Sidebar -->
      <div id="sidebar" class="col-md-3">
         <ul class="categories">
            <li ng-controller="genreController" ng-init="getGenres()">
               <h4>Kategorije</h4>
               <ul ng-repeat="genre in genreList">
               <li><a href="#<c:out value="{{genre.genreName}}"/>">{{genre.genreName}}</a></li>
               </ul>
            </li>
         </ul>
      </div>
      <!-- End Sidebar -->



      <!-- Content -->
      <div id="content" class="col-lg-6">
         <!-- Books -->
         <div class="products" ng-init="getBooksByGenre(undefined,0, 12)">
            <h3>Novi naslovi</h3>
            <ul class="row">
               <li class="col-sm-4" ng-repeat="book in BooksByGenreList">
                  <book book-object = "book"></book>
               </li>
            </ul>
         <!-- End Books -->
         </div>  
         <div class="c2">&nbsp;</div>


         
         <nav aria-label="Navigacija">
           <ul class="pagination">
             <li class="page-item" ng-click="paginationMove()">
                 <span aria-hidden="true">&laquo;</span>
             </li>


             <li class="page-item"><span>1</span></li>
             <li class="page-item"><span>2</span></li>
             <li class="page-item"><span>3</span></li>
             <li class="page-item"><span>4</span></li>
             <li class="page-item"><span>5</span></li>

             <li class="page-item" ng-click="paginationMove()">
                 <span aria-hidden="true">&raquo;</span>
             </li>
           </ul>
         </nav>    
      </div>
      <!-- End Content -->
      <div class="cl">&nbsp;</div>



   </div>
   <!-- End Main -->

<%@include file="/WEB-INF/pages/template/footer.jsp" %>  
