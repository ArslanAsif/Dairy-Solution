<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" enableEventValidation="false" CodeFile="post_add.aspx.cs" Inherits="_Default" %>

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
                <div class="col-md-6 col-md-offset-3">
                    <br />
                    <asp:TextBox ID="postHeading" runat="server" type="text" class="form-control control-height" placeholder="Heading"></asp:TextBox>
					<br/>
					<textarea class="form-control" id="postSummary" runat="server" name="suppName" placeholder="Short Summary"/><br />
                    <textarea class="form-control" rows="10" id="postDetail" runat="server" name="suppName" placeholder="Detail"/><br />
                    <label>Attach Picture</label>&nbsp; &nbsp;<asp:FileUpload ID="postImage" runat="server" />
                    <br/>
                    <asp:Button ID="addPost" runat="server" Text="Post" style = "width: 100%; margin-left: 2px" type = "submit" class = "btn btn-primary" OnClick="addPost_Click"/>
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

