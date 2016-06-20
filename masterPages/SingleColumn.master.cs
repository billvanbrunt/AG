using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class masterPages_SingleColumn : System.Web.UI.MasterPage
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
}


   protected void CurrentAGStudents_Click(object sender, EventArgs e){


    }
   protected void Admin_Click(object sender, EventArgs e)
   {

       
   }
   protected void Help_Click(object sender, EventArgs e)
   {


  }

   public static class Global
   {

       static string _GPC;


       public static string GPC
       {
           get
           {
               return _GPC;
           }
           set
           {
               _GPC = value;
           }
       }

   }

}
