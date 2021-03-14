FROM <image>:<tag> as builder

COPY [<files>, <dst_path>]

WORKDIR </the/workdir/path>

RUN <command>

COPY [<directory>, <dst_path>]

RUN <command>


# Productive image
FROM <baseImage>

COPY [<files>, <dst_path>]

WORKDIR <the/workdir/path>

RUN <command>

COPY --from=<stage> [<src>, <dst>]

EXPOSE <port>

CMD <command>