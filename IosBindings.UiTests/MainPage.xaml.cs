using System.Text;

namespace IosBindings.UiTests
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private async void OnCounterClicked(object? sender, EventArgs e)
        {
            string widgetName = "MyCustomWidget";
            var messageBuilder = new StringBuilder();

            try
            {
#if IOS
                var widgetCenterProxy = new iOSBindings.WidgetCenterProxy();
                widgetCenterProxy.ReloadTimeLinesOfKind(widgetName);

                widgetCenterProxy.GetCurrentConfigurationsWithCompletion((configurations) =>
                {
                    foreach (var config in configurations)
                    {
                        messageBuilder.AppendLine($"Widget Kind: {config.Kind}, Family: {config.Family}");
                    }
                });
#elif MACCATALYST
                var widgetCenterProxy = new iOSBindings.WidgetCenterProxy();
                widgetCenterProxy.ReloadTimeLinesOfKind(widgetName);

                widgetCenterProxy.GetCurrentConfigurationsWithCompletion((configurations) =>
                {
                    foreach (var config in configurations)
                    {
                        messageBuilder.AppendLine($"Widget Kind: {config.Kind}, Family: {config.Family}");
                    }
                });
#endif

                await DisplayAlert("Refresh Widget", $"Request to refresh widget {widgetName} has been send. {Environment.NewLine}{messageBuilder}", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Error", $"Failed to refresh widget {widgetName}: {ex.Message}", "OK");
            }
        }
    }
}
