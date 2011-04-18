package joelhooks.pixelperfector.view
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;

    import joelhooks.pixelperfector.FileLoadService;
    import joelhooks.pixelperfector.model.signals.CurrentImageDataUpdated;

    import org.robotlegs.mvcs.Mediator;

    public class PixelPerfectorAppMediator extends Mediator
    {
        [Inject]
        public var view:PixelPerfector;

        [Inject]
        public var loadService:FileLoadService;

        [Inject]
        public var updated:CurrentImageDataUpdated;

        override public function onRegister():void
        {
            updated.add(function(data:BitmapData):void{
                var window:PictureWindow = new PictureWindow();
                window.source = new Bitmap(data);
                window.open();
            });

            view.fetch.add(function():void{
                loadService.openFile();
            });

        }
    }
}