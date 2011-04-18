package joelhooks.pixelperfector
{
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.filesystem.File;
    import flash.net.FileFilter;
    import flash.net.URLRequest;

    import joelhooks.pixelperfector.model.CurrentImageDataModel;

    import mx.controls.Image;

    import org.robotlegs.mvcs.Actor;

    public class FileLoadService extends Actor
    {
        [Inject]
        public var currentImageDataModel:CurrentImageDataModel;

        public function openFile():void
        {
            var loader:Loader;

            var file:File = new File();
            var imagesFilter:FileFilter = new FileFilter("Images", "*.jpg;*.jpeg;*.gif;*.png");
            file.browseForOpen("Open file", [imagesFilter]);
            file.addEventListener(Event.SELECT, imgSelected);

            function imgSelected(event:Event):void
            {
                loader = new Loader();
                var urlReq:URLRequest = new URLRequest(file.url);
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, imgLoaded);
                loader.load(urlReq);
            }

            function imgLoaded(event:Event):void
            {
                var bmp:Bitmap = new Bitmap();
                bmp = loader.content as Bitmap;
                currentImageDataModel.imageData = bmp.bitmapData;
            }
        }
    }
}