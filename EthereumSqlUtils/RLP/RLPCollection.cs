using System.Collections.Generic;

namespace EthereumSqlUtils.RLP
{
    public class RLPCollection : List<IRLPElement>, IRLPElement
    {
        public byte[] RLPData { get; set; }
    }
}