import "@typespec/http";

using Http;

@tag("Notification")
namespace EngTrainingSocial.Notification {
  enum NotificationType {
    newComment: "NEW_COMMENT",
    newPost: "NEW_POST",
  }

  model Notification {
    @doc("Unique identifier for the notification")
    id: uuid;

    @doc("Notification type of the notification")
    type: NotificationType;

    @doc("The id of the related content, such as comment and post")
    relatedId: uuid;

    @doc("Timestamp of when the post was created")
    createdAt: string;

    @doc("Timestamp of when the post was last updated")
    updatedAt: string;
  }

  @route("/notifications")
  @get
  op getNotifications(): {
    @statusCode statusCode: 200;
    @body notifications: Notification[];
  } | {
    @statusCode statusCode: 400;
  };
}
