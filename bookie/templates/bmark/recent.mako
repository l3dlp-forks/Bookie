<%inherit file="/main_wrap.mako" />
<%namespace file="func.mako" import="display_bmark_list, bmarknextprev, tag_filter"/>
<%def name="title()">Recent Bookmarks</%def>

<h1></h1>

<!-- Show the tag filter ui -->
<%
    if tags:
        url = 'bmark_recent_tags'
    else:
        url = 'bmark_recent'

    if username:
        url = 'user_' + url

%>
<div class="yui3-g data_list">
    <div class="yui3-u-2-3">
        ${tag_filter(url, tags=tags, username=username)}
    </div>
    <div class="yui3-u-1-3 col_end">Showing ${max_count} bookmarks</div>

    <div class="yui3-u-7-8 buttons">
        % if username is not None:
           <a href="${request.route_url('user_bmark_new', username=username)}" class="button">+ Add</a>
        % endif
    </div>
    <div class="yui3-u-1-8 col_end buttons">
        ${bmarknextprev(page, max_count, count, url, tags=tags, username=username)}
    </div>

    <div class="yui3-u-1 data_body">
        ${display_bmark_list(bmarks, username=username)}
    </div>

    <div class="yui3-u-7-8">&nbsp;</div>

    <div class="yui3-u-1-8 col_end buttons">
        ${bmarknextprev(page, max_count, count, url, tags=tags, username=username)}
    </div>
</div>