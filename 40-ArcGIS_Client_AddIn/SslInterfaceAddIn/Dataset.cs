using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace SslInterfaceAddIn
{
    public class Dataset : ESRI.ArcGIS.Desktop.AddIns.ComboBox
    {
        public Dataset()
        {
            this.Add("Línea de costa");
            this.Add("Urbano");
            this.Add("Unidades fisiográficas");
        }

        protected override void OnUpdate()
        {
            Enabled = ArcCatalog.Application != null;
        }
    }

}
