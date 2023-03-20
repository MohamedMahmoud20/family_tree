
abstract class ReportsStates{}

class InitialState extends ReportsStates{}


class VisibleTypeBillSuccess extends ReportsStates{}
class VisibleChooseUserSuccess extends ReportsStates{}
class VisibleChooseDelegateSuccess extends ReportsStates{}
class VisibleChooseBranchSuccess extends ReportsStates{}

class ISCheckedLoading extends ReportsStates{}
class ISCheckedSuccess extends ReportsStates{}


class ShowReportLoading extends ReportsStates{}
class ShowReportSuccess extends ReportsStates{}