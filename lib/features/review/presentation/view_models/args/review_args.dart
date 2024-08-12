class ReviewArgs {
  final int clientId;
  final int workerId;
  final int projectId;
  final String reviewedName;
  final String rated;

  ReviewArgs(
      {required this.clientId,
      required this.rated,
      required this.projectId,
      required this.workerId,
      required this.reviewedName});
}
