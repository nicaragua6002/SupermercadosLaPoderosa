using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SupermercadosLaPoderosa.Startup))]
namespace SupermercadosLaPoderosa
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
