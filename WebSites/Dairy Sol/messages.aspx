<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="messages.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">
        <div class="container-fluid">
             <!-- Page Heading -->
            <div class="row">
                <div class="col-md-4">
                    <h1 class="page-header">
                        Messages <small></small><a class="btn btn-default" href="#" data-toggle="modal" data-target="#createMsgModal"><i class="fa fa-pencil"></i>&nbsp;<i>&nbsp;</i>Create</a>
                    </h1>
                </div>
                    
                <!--search table-->
                <div class="col-md-4 col-md-offset-4">
				    <div class="input-group" style="margin-top: 55px">
					
					    <input type="text" class="form-control control-height" placeholder="Search" name="srch-term" id="srch-term">
					    <div class="input-group-btn">
						    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
					    </div>
				    </div>
                </div>
            </div>

            <div class="row">
                <!--Conversation list-->
                <div class="col-md-4">
                <div class="list-group" style="cursor: pointer; cursor: hand">

                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">       
                        <HeaderTemplate></HeaderTemplate>

                        <ItemTemplate>
                            <div class="list-group-item">
                                <div class="media">
                                    <button type="button" class="close"><span>&times;</span></button>
                                    <div class="media-left">
                                        <a href="#">
                                            <img class="media-object" src="<%#Eval("employee_picture") %>" width="65px" height="65px">
                                            
                                        </a>
                                    </div>
                                
                                    <div class="media-body">
                                        <h4 class="media-heading"><span><%#Eval("employee_name") %></span> <span class="badge"><%#Eval("status") %></span></h4>
                                        <p><%#Eval("message") %></p>
                                        <asp:Button runat="server" ID="getIdbtn" CommandArgument='<%#Eval("source_id")+";"+Eval("employee_name") %>' Text="Click" OnClick="getIdbtn_Click" style="position:absolute;height:85px ; width: 330px; margin-top:-70px; margin-left: -90px; opacity: 0"/>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
					
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                                    
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Dairy_SolutionConnectionString %>" SelectCommand="SELECT m.source_id, e.employee_picture, e.employee_name, m.status, m.message, m.date 
                                                                                                                                                                    FROM messages AS m 
                                                                                                                                                                    INNER JOIN employee_info AS e 
                                                                                                                                                                    ON m.source_id = e.employee_id 
                                                                                                                                                                    INNER JOIN (select source_id, max(date) As Date from messages where dest_id=@user_id group by source_id) as g_sid 
                                                                                                                                                                    ON m.source_id = g_sid.source_id AND m.date = g_sid.Date 
                                                                                                                                                                    ORDER BY date DESC">

                    
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="NULL" Name="user_id" SessionField="userId" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="newLabel" runat="server" hidden="hidden"></asp:Label>
                    
                </div>
                </div>

                <!--Conversation repeater-->
                <div class="col-md-8">
                    <div class="list-group"><div class="list-group-item">
                    

                    <form class="form-group">
                        <h3 runat="server" style="margin-top: 5px" id="get_sender_name"></h3>
                        <div class="input-group" style="padding-top:5px">
                            <asp:TextBox ID ="message_input" runat="server" CssClass="form-control control-height" placeholder="Message" type="text"></asp:TextBox>
                            <div class="input-group-btn">
                            <asp:Button ID="msg_submit2" runat="server" Text="Send" type = "submit" class = "btn btn-primary" OnClick="msg_submit2_Click"/>
                        </div>
                        </div><hr />
                    </form>
                    
                    
                    <asp:Repeater ID="Repeater3" runat="server" EnableViewState="False">      
                        <HeaderTemplate></HeaderTemplate>

                        <ItemTemplate>
                            <!--<button id="js_func" onclick='functionName(</%#Session["userId"] %>, </%#Eval("source_id") %>)'>yo</button>-->
                            
                            <div class="media">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="media-left" id="img_left">
                                            <a href="">
                                                <img class="media-object" src="<%#Eval("employee_picture") %>" width="65px" height="65px">
                                            </a>
                                        </div>
                                        
                                        <div class="media-body" id="text_left" style="padding-right: 75px">
                                            <h4 class="media-heading"><span><%#Eval("employee_name") %></h4>
                                            <p class="small text-muted" style="font-size: 80%; margin-top: 0px"><i class="fa fa-clock-o"></i> <%#Eval("date") %></p>
                                            <p><%#Eval("message") %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
											
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                    
                    </div></div>
                              
                    <div style="overflow: hidden;">
                    <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand" OnItemDataBound="rptPaging_ItemDataBound">
                        <HeaderTemplate><ul class="pagination" style="margin-top: 0px; float: right"></HeaderTemplate>
                        <ItemTemplate>
                            
                            <li>
                                <asp:LinkButton ID="btnPage"
                                        
                                    CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                    runat="server"><%# Container.DataItem %>
                                </asp:LinkButton>
                            </li>
                            
                       </ItemTemplate>
                        <FooterTemplate></ul></FooterTemplate>
                    </asp:Repeater>
                    </div>

                </div>
            </div>

            <!--Create message modal -->
            <div class="modal fade" id="createMsgModal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="fa fa-edit"></i> Create Message</h4>
                  </div>
                  <div class="modal-body">
                    <br/>
                        <asp:DropDownList ID="msg_DropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="employee_name" DataValueField="employee_id" CssClass="form-control control-height">
                        </asp:DropDownList>
                      <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Dairy_SolutionConnectionString %>' SelectCommand="SELECT [employee_id], [employee_name] FROM [employee_info] WHERE ([employee_id] != @employee_id)">
                          <SelectParameters>
                              <asp:SessionParameter SessionField="userId" Name="employee_id" Type="Int32"></asp:SessionParameter>
                          </SelectParameters>
                      </asp:SqlDataSource></br/>
                        <asp:TextBox ID ="message1" runat="server" TextMode="MultiLine" rows="4" CssClass="form-control control-height" placeholder="Message"></asp:TextBox><br/>
                  </div>
                  <div class="modal-footer">
                      <div class="pull-right">
                          <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" Text="Cancel" data-dismiss="modal" />
                          <asp:Button ID="message_submit" runat="server" Text="Submit" type = "submit" class = "btn btn-primary" OnClick="send_message_Click"/>
                      </div>
                  </div>
                </div><!-- /.modal-content -->
              </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
    </div>

</asp:Content>
