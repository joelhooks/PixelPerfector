package joelhooks.pixelperfector
{

    import joelhooks.pixelperfector.model.CurrentImageDataModel;
    import joelhooks.pixelperfector.model.signals.CurrentImageDataUpdated;
    import joelhooks.pixelperfector.view.PixelPerfectorAppMediator;

    import org.robotlegs.mvcs.Context

    public class PixelPerfectorContext extends Context
    {

        override public function startup():void
        {
            injector.mapSingleton(FileLoadService);
            injector.mapSingleton(CurrentImageDataModel);
            injector.mapSingleton(CurrentImageDataUpdated);

            mediatorMap.mapView(PixelPerfector, PixelPerfectorAppMediator);

            super.startup();
        }
    }
}