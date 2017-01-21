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
             <div class="products" ng-init="getBooksByGenre('Drama',0, 12)">
                <h3>Novi naslovi</h3>
              <ul class="row" ng-controller="optionsController">
                  <div class="col-lg-12" style="padding-bottom: 5px;"> 
                      <select class="selectpicker pull-right" ng-model="options.value" ng-init="options.value='title asc'">
                				<option data-icon="glyphicon glyphicon-chevron-up" value="title asc">Naziv</option>
                				<option data-icon="glyphicon glyphicon-chevron-down" value="title desc">Naziv</option>
                				<option data-icon="glyphicon glyphicon-chevron-up" value="price asc">Cena</option>
                				<option data-icon="glyphicon glyphicon-chevron-down" value="price desc">Cena</option>
                			</select>
            			</div>
                 <li class="col-sm-4" ng-repeat="book in BooksByGenreList">
                    <book book-object = "book"></book>
                 </li>
              </ul>
             <!-- End Books -->
             </div>  
         <div class="c2">&nbsp;</div>


           <div class="container col-lg-12">
                <div class="text-center">
                    <!-- pager -->
                    <ul ng-if="pager.pages.length" class="pagination">
                        <li ng-class="{disabled:pager.currentPage === 1}">
                            <a ng-click="setPage(1)">First</a>
                        </li>
                        <li ng-class="{disabled:pager.currentPage === 1}">
                            <a ng-click="setPage(pager.currentPage - 1)">Previous</a>
                        </li>
                        <li ng-repeat="page in pager.pages" ng-class="{active:pager.currentPage === page}">
                            <a ng-click="setPage(page)">{{page}}</a>
                        </li>                
                        <li ng-class="{disabled:pager.currentPage === pager.totalPages}">
                            <a ng-click="setPage(pager.currentPage + 1)">Next</a>
                        </li>
                        <li ng-class="{disabled:pager.currentPage === pager.totalPages}">
                            <a ng-click="setPage(pager.totalPages)">Last</a>
                        </li>
                    </ul>
                </div>
            </div>

      </div>
      <!-- End Content -->
      <div class="cl">&nbsp;</div>



   </div>
   <!-- End Main -->

<%@include file="/WEB-INF/pages/template/footer.jsp" %>  