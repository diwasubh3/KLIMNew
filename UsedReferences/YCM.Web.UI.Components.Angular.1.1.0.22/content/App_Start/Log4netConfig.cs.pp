using System.IO;
using YCM.Web.UI.Components.Angular;


namespace $rootnamespace$
{
    public class Log4netConfig
    {
        public static void ConfigureLog4Net(System.Web.HttpServerUtility server)
        {
            log4net.Config.XmlConfigurator.Configure(new FileInfo(server.MapPath("~/Web.config")));
        }
    }
}