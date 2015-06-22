<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="post_update.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

    <div class="container-fluid">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Add Post <small>Updates</small>
                </h1>
            </div>
        </div>
				
        <form class="form-group">
            <div class="row">
                <div class="col-lg-12">

                <div class="col-md-3 col-md-offset-1">
                    <br /><br/>
                    <asp:Image ID="Image1" runat="server" width="250px" Height="250px"/>
                    <br/>
                    <label>Attach Picture</label><asp:FileUpload ID="postImage" runat="server" />
                    <asp:Button runat="server" cssClass="btn btn-xs btn-primary" OnClick="changePic" Text="Upload"/>
                </div>
                <div class="col-md-6 col-md-offset-1">
                    <br />
                    <asp:Button runat="server" CssClass="btn btn-sm btn-primary pull-right" Text="Update Date" OnClick="changeDate"></asp:Button>
                    <asp:Label cssClass="pull-right" ID="date" runat="server" Text="Label" style="margin-right:10px"></asp:Label><br/><br/>
                    <asp:TextBox ID="postHeading" runat="server" type="text" class="form-control control-height" placeholder="Heading"></asp:TextBox>
					<br/>
					<textarea class="form-control" id="postSummary" runat="server" name="suppName" placeholder="Short Summary"/><br />
                    <textarea class="form-control" rows="10" id="postDetail" runat="server" name="suppName" placeholder="Detail"/><br />
                    
                    <br/>
                    <asp:Button ID="updatePost" runat="server" Text="Update Post" style = "width: 100%; margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="updatePost_Click"/>
                    <br/>
                </div>
                </div>
            </div>
            <br />
        </form>					
    </div>
    <!-- /.container-fluid -->

</div>
<!-- /#page-wrapper -->
</asp:Content>