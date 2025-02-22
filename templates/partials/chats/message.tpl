<li component="chat/message" class="chat-message mx-2 pe-2 fw-light clear{{{ if messages.deleted }}} deleted{{{ end }}} {{{ if messages.pinned}}} pinned{{{ end }}}" data-mid="{messages.messageId}" data-uid="{messages.fromuid}" data-index="{messages.index}" data-self="{messages.self}" data-break="{messages.newSet}" data-timestamp="{messages.timestamp}" data-username="{messages.fromUser.username}">

	{{{ if messages.parent }}}
	<!-- IMPORT partials/chats/parent.tpl -->
	{{{ end }}}

	<div class="message-header">
		<a href="{config.relative_path}/user/{messages.fromUser.userslug}">{buildAvatar(messages.fromUser, "32px", true, "not-responsive")}</a>
		<span class="chat-user fw-bold"><a href="{config.relative_path}/user/{messages.fromUser.userslug}">{messages.fromUser.displayname}</a></span>
		<!-- IF ../fromUser.banned -->
		<span class="badge bg-danger">[[user:banned]]</span>
		<!-- END -->
		<!-- IF ../fromUser.deleted -->
		<span class="badge bg-danger">[[user:deleted]]</span>
		<!-- END -->
		<small class="chat-timestamp text-muted ms-2 timeago" title="{messages.timestampISO}"></small>

		<div component="chat/message/edited" class="text-muted float-end {{{ if !messages.edited }}}hidden{{{ end }}}" title="[[global:edited-timestamp, {messages.editedISO}]]"><i class="fa fa-edit"></i></span></div>
	</div>
	<div class="message-body-wrapper">
		<div component="chat/message/body" class="message-body">
			{messages.content}
		</div>
		<!-- IMPORT partials/chats/reactions.tpl -->
		<div component="chat/message/controls" class="btn-group controls">
			<!-- IMPORT partials/chats/add-reaction.tpl -->
			<button class="btn btn-sm btn-link" data-action="reply" title="[[topic:reply]]"><i class="fa fa-reply"></i></button>
			{{{ if (isAdminOrGlobalMod || (!config.disableChatMessageEditing && messages.self)) }}}
			<button class="btn btn-sm btn-link" data-action="edit" title="[[topic:edit]]"><i class="fa fa-pencil"></i></button>
			<button class="btn btn-sm btn-link" data-action="delete" title="[[topic:delete]]"><i class="fa fa-trash"></i></button>
			<button class="btn btn-sm btn-link" data-action="restore" title="[[topic:restore]]"><i class="fa fa-repeat"></i></button>
			{{{ end }}}
			{{{ if (isAdminOrGlobalMod || isOwner )}}}
				<button class="btn btn-sm btn-link" data-action="pin" title="[[modules:chat.pin-message]]"><i class="fa fa-thumbtack"></i></button>
				<button class="btn btn-sm btn-link" data-action="unpin" title="[[modules:chat.unpin-message]]"><i class="fa fa-thumbtack fa-rotate-90"></i></button>
			{{{ end }}}
			{{{ if isAdminOrGlobalMod }}}
			<button class="btn btn-sm btn-link chat-ip-button" title="[[modules:chat.show-ip]]"><i class="fa fa-info-circle"></i></button>
			{{{ end }}}
			<button class="btn btn-sm btn-link" data-action="copy-link" title="[[modules:chat.copy-link]]" data-mid="{messages.mid}"><i class="fa fa-link"></i></button>
		</div>
	</div>
</li>