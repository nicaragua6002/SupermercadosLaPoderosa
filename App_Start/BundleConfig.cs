using System.Web;
using System.Web.Optimization;

namespace SupermercadosLaPoderosa
{
    public class BundleConfig
    {
        // Para obtener más información sobre las uniones, visite https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Utilice la versión de desarrollo de Modernizr para desarrollar y obtener información. De este modo, estará
            // para la producción, use la herramienta de compilación disponible en https://modernizr.com para seleccionar solo las pruebas que necesite.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            //Agregamos los bundles para UZA
            bundles.Add(new StyleBundle("~/Content/uza").Include(
                "~/Content/uza/style.css"
                ));
            //Agregamos el bundle para script
            bundles.Add(new ScriptBundle("~/bundles/uzajquery").Include(
                     "~/Content/uza/js/jquery.min.js"
                     , "~/Content/uza/js/popper.min.js"
                     , "~/Content/uza/js/uza.bundle.js"
                     , "~/Content/uza/js/bootstrap.min.js"
                     , "~/Content/uza/js/default-assets/active.js"
                     ));
        }
    }
}
