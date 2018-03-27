namespace EthereumSqlUtils.Asn1.X9
{
	public abstract class X9ECParametersHolder
	{
		private X9ECParameters parameters;

		public X9ECParameters Parameters
		{
			get
			{
                //TODO CEK verify that this doesn't need a lock
                //lock (this)
                //{
                    if (parameters == null)
                    {
                        parameters = CreateParameters();
                    }

                    return parameters;
                //}
            }
        }

		protected abstract X9ECParameters CreateParameters();
	}
}
