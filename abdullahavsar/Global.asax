<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing"%>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        RegisterRoutes_1(RouteTable.Routes);
        RegisterRoutes_2(RouteTable.Routes);
        

    }

    private void RegisterRoutes_1(RouteCollection routes) 
    {
        routes.MapPageRoute("", "Site/makaleler/{MAKALEBASLIK}_{MAKALEID}", "~/Site/MakaleDetay.aspx");
    }
    private void RegisterRoutes_2(RouteCollection routes)
    {
        routes.MapPageRoute("", "Site/{MAKALEBASLIK}_{MAKALEID}", "~/Site/MakaleDetay.aspx");
    }
    
    void Application_End(object sender, EventArgs e) 
    {
       

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
       

    }

    void Session_Start(object sender, EventArgs e) 
    {
       

    }

    void Session_End(object sender, EventArgs e) 
    {
       

    }
       
</script>
