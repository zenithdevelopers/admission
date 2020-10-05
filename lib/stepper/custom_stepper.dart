import 'package:admission_process/widgets/MyRaisedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum CustomStepState {
  /// A step that displays its index in its circle.
  indexed,

  /// A step that displays a pencil icon in its circle.
  editing,

  /// A step that displays a tick icon in its circle.
  complete,

  /// A step that is disabled and does not to react to taps.
  disabled,

  /// A step that is currently having an error. e.g. the user has submitted wrong
  /// input.
  error,
}

enum CustomStepperType {
  /// A vertical layout of the steps with their content in-between the titles.
  vertical,

  /// A horizontal layout of the steps with their content below the titles.
  horizontal,
}

const TextStyle _kStepStyle = TextStyle(
  fontSize: 12.0,
  color: Colors.white,
);
const Color _kErrorLight = Colors.red;
final Color _kErrorDark = Colors.red.shade400;
const Color _kCircleActiveLight = Colors.white;
const Color _kCircleActiveDark = Colors.black87;
const Color _kDisabledLight = Colors.black38;
const Color _kDisabledDark = Colors.white38;
const double _kStepSize = 30.0;
const double _kTriangleHeight =
    _kStepSize * 0.866025; // Triangle height. sqrt(3.0) / 2.0

Color lineColor1 = Colors.grey;
Color lineColor2 = Colors.grey;
Color lineColor3 = Colors.grey;
Color lineColor4 = Colors.grey;

String next = 'Next';
String previous = 'Previous';

bool isVisible = false;

/// The step can have a title and subtitle,
/// an icon within its circle, some content and a state that governs its
/// styling.
///
/// See also:
///
///
///  * <https://material.io/archive/guidelines/components/steppers.html>
class CustomStep {
  /// Creates a step
  ///
  /// The [title], [content], and [state] arguments must not be null.
  CustomStep({
    @required this.title,
    this.subtitle,
    @required this.content,
    this.state = CustomStepState.indexed,
    this.isActive = false,
  })  : assert(title != null),
        assert(content != null),
        assert(state != null);

  void setVisibility(bool state) {
    isVisible = state;
  }

  void setNextButtonText(String text) {
    next = text;
  }

  void setPreviousButtonText(String text) {
    previous = text;
  }

  Color getLineColor1() {
    return lineColor1;
  }

  Color getLineColor2() {
    return lineColor2;
  }

  Color getLineColor3() {
    return lineColor3;
  }

  Color getLineColor4() {
    return lineColor4;
  }

  void setLineColor1(Color color) {
    lineColor1 = color;
  }

  void setLineColor2(Color color) {
    lineColor2 = color;
  }

  void setLineColor3(Color color) {
    lineColor3 = color;
  }

  void setLineColor4(Color color) {
    lineColor4 = color;
  }

  /// The title of the step that typically describes it.
  Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  Widget subtitle;

  /// The content of the step that appears below the [title] and [subtitle].
  ///
  /// Below the content, every step has a 'continue' and 'cancel' button.
  Widget content;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  CustomStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  bool isActive;
}

/// A material stepper widget that displays progress through a sequence of
/// steps. Steppers are particularly useful in the case of forms where one step
/// requires the completion of another one, or where multiple steps need to be
/// completed in order to submit the whole form.
///
/// The widget is a flexible wrapper. A parent class should pass [currentStep]
/// to this widget based on some logic triggered by the three callbacks that it
/// provides.
///
/// See also:
///
///  * [CustomStep]
///  * <https://material.io/archive/guidelines/components/steppers.html>
class CustomStepper extends StatefulWidget {
  /// Creates a stepper from a list of steps.
  ///
  /// This widget is not meant to be rebuilt with a different list of steps
  /// unless a key is provided in order to distinguish the old stepper from the
  /// new one.
  ///
  /// The [steps], [type], and [currentStep] arguments must not be null.
  CustomStepper({
    Key key,
    @required this.steps,
    this.physics,
    this.type = CustomStepperType.vertical,
    this.currentStep = 0,
    this.onStepTapped,
    this.onStepContinue,
    this.onStepCancel,
    this.controlsBuilder,
  })  : assert(steps != null),
        assert(type != null),
        assert(currentStep != null),
        assert(0 <= currentStep && currentStep < steps.length),
        super(key: key);

  /// The steps of the stepper whose titles, subtitles, icons always get shown.
  ///
  /// The length of [steps] must not change.
  final List<CustomStep> steps;

  /// How the stepper's scroll view should respond to user input.
  ///
  /// For example, determines how the scroll view continues to
  /// animate after the user stops dragging the scroll view.
  ///
  /// If the stepper is contained within another scrollable it
  /// can be helpful to set this property to [ClampingScrollPhysics].
  final ScrollPhysics physics;

  /// The type of stepper that determines the layout. In the case of
  /// [StepperType.horizontal], the content of the current step is displayed
  /// underneath as opposed to the [StepperType.vertical] case where it is
  /// displayed in-between.
  final CustomStepperType type;

  /// The index into [steps] of the current step whose content is displayed.
  final int currentStep;

  /// The callback called when a step is tapped, with its index passed as
  /// an argument.
  final ValueChanged<int> onStepTapped;

  /// The callback called when the 'continue' button is tapped.
  ///
  /// If null, the 'continue' button will be disabled.
  final VoidCallback onStepContinue;

  /// The callback called when the 'cancel' button is tapped.
  ///
  /// If null, the 'cancel' button will be disabled.
  final VoidCallback onStepCancel;

  /// The callback for creating custom controls.
  ///
  /// If null, the default controls from the current theme will be used.
  ///
  /// This callback which takes in a context and two functions: [onStepContinue]
  /// and [onStepCancel]. These can be used to control the stepper.
  ///
  /// {@tool dartpad --template=stateless_widget_scaffold}
  /// Creates a stepper control with custom buttons.
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Stepper(
  ///     controlsBuilder:
  ///       (BuildContext context, { VoidCallback onStepContinue, VoidCallback onStepCancel }) {
  ///          return Row(
  ///            children: <Widget>[
  ///              TextButton(
  ///                onPressed: onStepContinue,
  ///                child: const Text('NEXT'),
  ///              ),
  ///              TextButton(
  ///                onPressed: onStepCancel,
  ///                child: const Text('CANCEL'),
  ///              ),
  ///            ],
  ///          );
  ///       },
  ///     steps: const <Step>[
  ///       Step(
  ///         title: Text('A'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///       Step(
  ///         title: Text('B'),
  ///         content: SizedBox(
  ///           width: 100.0,
  ///           height: 100.0,
  ///         ),
  ///       ),
  ///     ],
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  final ControlsWidgetBuilder controlsBuilder;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper>
    with TickerProviderStateMixin {
  List<GlobalKey> _keys;
  final Map<int, CustomStepState> _oldStates = <int, CustomStepState>{};

  @override
  void initState() {
    super.initState();
    _keys = List<GlobalKey>.generate(
      widget.steps.length,
      (int i) => GlobalKey(),
    );

    for (int i = 0; i < widget.steps.length; i += 1)
      _oldStates[i] = widget.steps[i].state;
  }

  @override
  void didUpdateWidget(CustomStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    assert(widget.steps.length == oldWidget.steps.length);

    for (int i = 0; i < oldWidget.steps.length; i += 1)
      _oldStates[i] = oldWidget.steps[i].state;
  }

  bool _isFirst(int index) {
    return index == 0;
  }

  bool _isLast(int index) {
    return widget.steps.length - 1 == index;
  }

  bool _isCurrent(int index) {
    return widget.currentStep == index;
  }

  bool _isDark() {
    return Theme.of(context).brightness == Brightness.dark;
  }

  //vertical line
  Widget _buildLine(bool visible) {
    return Container(
      width: visible ? 1.0 : 0.0,
      height: 16.0,
      color: Colors.blue,
    );
  }

  Widget _buildCircleChild(int index, bool oldState) {
    final CustomStepState state =
        oldState ? _oldStates[index] : widget.steps[index].state;
    final bool isDarkActive = _isDark() && widget.steps[index].isActive;
    assert(state != null);
    switch (state) {
      case CustomStepState.indexed:
      case CustomStepState.disabled:
        return Text(
          '${index + 1}',
          style: isDarkActive
              ? _kStepStyle.copyWith(color: Colors.black87)
              : _kStepStyle,
        );
      case CustomStepState.editing:
        return Icon(
          Icons.edit,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
      case CustomStepState.complete:
        return Icon(
          Icons.check,
          color: isDarkActive ? _kCircleActiveDark : _kCircleActiveLight,
          size: 18.0,
        );
      case CustomStepState.error:
        return const Text('!', style: _kStepStyle);
    }
    return null;
  }

  Color _circleColor(int index) {
    final ThemeData themeData = Theme.of(context);
    if (!_isDark()) {
      return widget.steps[index].isActive
          ? themeData.primaryColor
          : Colors.black38;
    } else {
      return widget.steps[index].isActive
          ? themeData.accentColor
          : themeData.backgroundColor;
    }
  }

  Widget _buildCircle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: kThemeAnimationDuration,
        decoration: BoxDecoration(
          color: _circleColor(index),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: _buildCircleChild(index,
              oldState && widget.steps[index].state == CustomStepState.error),
        ),
      ),
    );
  }

  Widget _buildTriangle(int index, bool oldState) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: _kStepSize,
      height: _kStepSize,
      child: Center(
        child: SizedBox(
          width: _kStepSize,
          height:
              _kTriangleHeight, // Height of 24dp-long-sided equilateral triangle.
          child: CustomPaint(
            painter: _TrianglePainter(
              color: _isDark() ? _kErrorDark : _kErrorLight,
            ),
            child: Align(
              alignment: const Alignment(
                  0.0, 0.8), // 0.8 looks better than the geometrical 0.33.
              child: _buildCircleChild(
                  index,
                  oldState &&
                      widget.steps[index].state != CustomStepState.error),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (widget.steps[index].state != _oldStates[index]) {
      return AnimatedCrossFade(
        firstChild: _buildCircle(index, true),
        secondChild: _buildTriangle(index, true),
        firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
        secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
        sizeCurve: Curves.fastOutSlowIn,
        crossFadeState: widget.steps[index].state == CustomStepState.error
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      );
    } else {
      if (widget.steps[index].state != CustomStepState.error)
        return _buildCircle(index, false);
      else
        return _buildTriangle(index, false);
    }
  }

  Widget _buildVerticalControls() {
    if (widget.controlsBuilder != null)
      return widget.controlsBuilder(context,
          onStepContinue: widget.onStepContinue,
          onStepCancel: widget.onStepCancel);

    Color cancelColor;

    switch (Theme.of(context).brightness) {
      case Brightness.light:
        cancelColor = Colors.black54;
        break;
      case Brightness.dark:
        cancelColor = Colors.white70;
        break;
    }

    assert(cancelColor != null);

    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    // final MaterialLocalizations localizations = MaterialLocalizations.of(context);

    const OutlinedBorder buttonShape = RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)));
    const EdgeInsets buttonPadding = EdgeInsets.symmetric(horizontal: 16.0);

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 48.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // The Material spec no longer includes a Stepper widget. The continue
          // and cancel button styles have been configured to match the original
          // version of this widget.
          children: <Widget>[
            isVisible
                ? Container(
                    margin: const EdgeInsetsDirectional.only(start: 8.0),
                    child: RaisedButton.icon(
                      onPressed: widget.onStepCancel,
                      textColor: Colors.white,
                      color: Colors.blue,
                      icon: Icon(Icons.arrow_back_outlined),
                      label: Text(previous),
                    ),
                  )
                : Container(),
            MyRaisedButton.icon(
              onPressed: widget.onStepContinue,
              textColor: Colors.white,
              color: Colors.blue,
              icon: Icon(Icons.arrow_forward_outlined),
              label: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                child: Text(next),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _titleStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    assert(widget.steps[index].state != null);
    switch (widget.steps[index].state) {
      case CustomStepState.indexed:
      case CustomStepState.editing:
      case CustomStepState.complete:
        return textTheme.bodyText1;
      case CustomStepState.disabled:
        return textTheme.bodyText1
            .copyWith(color: _isDark() ? _kDisabledDark : _kDisabledLight);
      case CustomStepState.error:
        return textTheme.bodyText1
            .copyWith(color: _isDark() ? _kErrorDark : _kErrorLight);
    }
    return null;
  }

  TextStyle _subtitleStyle(int index) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    assert(widget.steps[index].state != null);
    switch (widget.steps[index].state) {
      case CustomStepState.indexed:
      case CustomStepState.editing:
      case CustomStepState.complete:
        return textTheme.caption;
      case CustomStepState.disabled:
        return textTheme.caption
            .copyWith(color: _isDark() ? _kDisabledDark : _kDisabledLight);
      case CustomStepState.error:
        return textTheme.caption
            .copyWith(color: _isDark() ? _kErrorDark : _kErrorLight);
    }
    return null;
  }

  Widget _buildHeaderText(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedDefaultTextStyle(
          style: _titleStyle(index),
          duration: kThemeAnimationDuration,
          curve: Curves.fastOutSlowIn,
          child: widget.steps[index].title,
        ),
        if (widget.steps[index].subtitle != null)
          Container(
            margin: const EdgeInsets.only(top: 2.0),
            child: AnimatedDefaultTextStyle(
              style: _subtitleStyle(index),
              duration: kThemeAnimationDuration,
              curve: Curves.fastOutSlowIn,
              child: widget.steps[index].subtitle,
            ),
          ),
      ],
    );
  }

  Widget _buildVerticalHeader(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Line parts are always added in order for the ink splash to
              // flood the tips of the connector lines.
              _buildLine(!_isFirst(index)),
              _buildIcon(index),
              _buildLine(!_isLast(index)),
            ],
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsetsDirectional.only(start: 12.0),
            child: _buildHeaderText(index),
          )),
        ],
      ),
    );
  }

  Widget _buildVerticalBody(int index) {
    return Stack(
      children: <Widget>[
        PositionedDirectional(
          start: 24.0,
          top: 0.0,
          bottom: 0.0,
          child: SizedBox(
            width: 24.0,
            child: Center(
              child: SizedBox(
                width: _isLast(index) ? 0.0 : 1.0,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
        AnimatedCrossFade(
          firstChild: Container(height: 0.0),
          secondChild: Container(
            margin: const EdgeInsetsDirectional.only(
              start: 60.0,
              end: 24.0,
              bottom: 24.0,
            ),
            child: Column(
              children: <Widget>[
                widget.steps[index].content,
                _buildVerticalControls(),
              ],
            ),
          ),
          firstCurve: const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
          secondCurve: const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
          sizeCurve: Curves.fastOutSlowIn,
          crossFadeState: _isCurrent(index)
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
      ],
    );
  }

  Widget _buildVertical() {
    return ListView(
      shrinkWrap: true,
      physics: widget.physics,
      children: <Widget>[
        for (int i = 0; i < widget.steps.length; i += 1)
          Column(
            key: _keys[i],
            children: <Widget>[
              InkWell(
                onTap: widget.steps[i].state != CustomStepState.disabled
                    ? () {
                        // In the vertical case we need to scroll to the newly tapped
                        // step.
                        Scrollable.ensureVisible(
                          _keys[i].currentContext,
                          curve: Curves.fastOutSlowIn,
                          duration: kThemeAnimationDuration,
                        );

                        if (widget.onStepTapped != null) widget.onStepTapped(i);
                      }
                    : null,
                canRequestFocus:
                    widget.steps[i].state != CustomStepState.disabled,
                child: _buildVerticalHeader(i),
              ),
              _buildVerticalBody(i),
            ],
          ),
      ],
    );
  }

  Widget buildHorizontal(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    final List<Widget> children = <Widget>[
      InkResponse(
        onTap: widget.steps[0].state != CustomStepState.disabled
            ? () {
                if (widget.onStepTapped != null) widget.onStepTapped(0);
              }
            : null,
        canRequestFocus: widget.steps[0].state != CustomStepState.disabled,
        child: Row(
          children: <Widget>[
            Container(
              height: 72.0,
              child: Center(
                child: _buildIcon(0),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: _buildHeaderText(0),
            ),
          ],
        ),
      ),
      Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 4.0,
            width: mediaSize.width / 17,
            color: lineColor1 //TODO:
            ),
      ),
      InkResponse(
        onTap: widget.steps[1].state != CustomStepState.disabled
            ? () {
                if (widget.onStepTapped != null) widget.onStepTapped(1);
              }
            : null,
        canRequestFocus: widget.steps[1].state != CustomStepState.disabled,
        child: Row(
          children: <Widget>[
            Container(
              height: 72.0,
              child: Center(
                child: _buildIcon(1),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: _buildHeaderText(1),
            ),
          ],
        ),
      ),
      Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 4.0,
            width: mediaSize.width / 17,
            color: lineColor2 //TODO:
            ),
      ),
      InkResponse(
        onTap: widget.steps[2].state != CustomStepState.disabled
            ? () {
                if (widget.onStepTapped != null) widget.onStepTapped(2);
              }
            : null,
        canRequestFocus: widget.steps[2].state != CustomStepState.disabled,
        child: Row(
          children: <Widget>[
            Container(
              height: 72.0,
              child: Center(
                child: _buildIcon(2),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: _buildHeaderText(2),
            ),
          ],
        ),
      ),
      Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            height: 4.0,
            width: mediaSize.width / 17,
            color: lineColor3 //TODO:
            ),
      ),
      InkResponse(
        onTap: widget.steps[3].state != CustomStepState.disabled
            ? () {
                if (widget.onStepTapped != null) widget.onStepTapped(3);
              }
            : null,
        canRequestFocus: widget.steps[3].state != CustomStepState.disabled,
        child: Row(
          children: <Widget>[
            Container(
              height: 72.0,
              child: Center(
                child: _buildIcon(3),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(start: 8.0),
              child: _buildHeaderText(3),
            ),
          ],
        ),
      ),
    ];

    return Column(
      children: <Widget>[
        Material(
          elevation: 2.0,
          child: Container(
            height: 72,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            physics: widget.physics,
            children: <Widget>[
              AnimatedSize(
                curve: Curves.fastOutSlowIn,
                duration: kThemeAnimationDuration,
                vsync: this,
                child: widget.steps[widget.currentStep].content,
              ),
              _buildVerticalControls(),
            ],
          ),
        ),
      ],
    );
  }

  void someFunction() {}

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    assert(() {
      if (context.findAncestorWidgetOfExactType<CustomStepper>() != null)
        throw FlutterError('Steppers must not be nested.\n'
            'The material specification advises that one should avoid embedding '
            'steppers within steppers. '
            'https://material.io/archive/guidelines/components/steppers.html#steppers-usage');
      return true;
    }());
    assert(widget.type != null);
    switch (widget.type) {
      case CustomStepperType.vertical:
        return _buildVertical();
      case CustomStepperType.horizontal:
        return buildHorizontal(context);
    }
    return null;
  }
}

// Paints a triangle whose base is the bottom of the bounding rectangle and its
// top vertex the middle of its top.
class _TrianglePainter extends CustomPainter {
  _TrianglePainter({
    this.color,
  });

  final Color color;

  @override
  bool hitTest(Offset point) => true; // Hitting the rectangle is fine enough.

  @override
  bool shouldRepaint(_TrianglePainter oldPainter) {
    return oldPainter.color != color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double base = size.width;
    final double halfBase = size.width / 2.0;
    final double height = size.height;
    final List<Offset> points = <Offset>[
      Offset(0.0, height),
      Offset(base, height),
      Offset(halfBase, 0.0),
    ];

    canvas.drawPath(
      Path()..addPolygon(points, true),
      Paint()..color = color,
    );
  }
}
