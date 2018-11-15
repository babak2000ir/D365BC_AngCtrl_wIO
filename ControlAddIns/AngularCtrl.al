controladdin AngularCtrl
{
    StartupScript = 'AngularApp/bundle.js';

    RequestedHeight = 1000;
    MinimumHeight = 1000;
    MaximumHeight = 1000;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    //Scripts =

    StyleSheets = 'AngularApp/styles.css';


    event ControlAddInReady();
    event ShowMessage(ptxtMessage: Text);

    procedure GetCustomer(ptxtCustomer: Text);
    procedure InitiEventCycle();
}