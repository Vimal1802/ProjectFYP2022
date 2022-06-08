Configuration IIS
{
    # This will generate three .mof files; web1.mof, web2.mof, web3.mof
    Node ('FYPVM1', 'FYPVM2', 'FYPVM3')
    {
        #ensure IIS is installed
        WindowsFeature IIS
        {
            Name = 'web-server'
            Ensure = 'Present'
        }

        #ensure the default document is configured for web app
        File default
        {
          DestinationPath = 'c:\inetpub\wwwroot\default.htm'
          Contents = 'Hello World'
          DependsOn = '[WindowsFeature]IIS'
          Ensure = 'Present'
        }
    }
}