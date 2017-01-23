<%@include file="/WEB-INF/pages/template/header.jsp" %>
	
	<div id="main" class="shell row" ng-controller="mainController">
			<section>
				<h1>Kartica</h1>						
			</section>
			<section class="cart-navigation">
				<div class="row">
					<div class="col-xs-12">
		            <div class="row">
		                
							 <div class="col-xs-12 col-sm-3">
		                    <div class="step" ng-class="{'active': checkStatus == 1 || checkStatus == undefined}">
		                        <span class="glyphicon glyphicon-home"></span> 
		                        Narudžbenica
		                        <div class="hidden-xs caret right"></div>
		                        <div class="visible-xs caret bottom"></div>
		                    </div>          
		                </div>	

		                <div class="col-xs-12 col-sm-3">
		                    <div class="step" ng-class="{'active': checkStatus == 2}">
		                        <i class="fa fa-truck"></i>
		                        Adresa isporuke
		                        <div class="hidden-xs caret right"></div>
		                        <div class="visible-xs caret bottom"></div>
		                    </div>          
		                </div>
		        
		                <div class="col-xs-12 col-sm-3">
		                    <div class="step" ng-class="{'active': checkStatus == 3}">
		                            <span class="glyphicon glyphicon-usd"></span> 
		                            Plaćanje
		                            <div class="hidden-xs caret right"></div>
		                        <div class="visible-xs caret bottom"></div>
		                    </div>
		                </div>
	            
	                	<div class="col-xs-12 col-sm-3">
	                    <div class="step" ng-class="{'active': checkStatus == 4}">
	                        <span class="glyphicon glyphicon-ok"></span> 
	                        Potvrda podataka           
	                    </div>
	                	</div>
		            </div>            
		        </div>
				</div>
			</section>	
			<section ng-init="initCartId('${cartId}')">
				<div ng-if="checkStatus == 1 || checkStatus == undefined" ng-include="'/bookstore/resources/routePages/cartInfo.html'"></div>
				<div ng-if="checkStatus == 2" ng-include="'/bookstore/resources/routePages/cartAdress.html'"></div>
				<div ng-if="checkStatus == 3" ng-include="'/bookstore/resources/routePages/cartPayment.html'"></div>
				<div ng-if="checkStatus == 4" ng-include="'/bookstore/resources/routePages/cartConfirmation.html'"></div>
			</section>
	</div>

<%@include file="/WEB-INF/pages/template/footer.jsp" %>	
