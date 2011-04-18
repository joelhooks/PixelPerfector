package joelhooks.pixelperfector.model
{
    import flash.display.BitmapData;

    import joelhooks.pixelperfector.model.signals.CurrentImageDataUpdated;

    import org.robotlegs.mvcs.Actor;

    public class CurrentImageDataModel extends Actor
    {
        [Inject]
        public var updated:CurrentImageDataUpdated;

        private var _imageData:BitmapData;

        public function get imageData():BitmapData
        {
            return _imageData;
        }

        public function set imageData(value:BitmapData):void
        {
            _imageData = value;
            updated.dispatch(imageData);
        }
    }
}