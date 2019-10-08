FROM appimagecrafters/docker-base

ADD install-pixman.sh /

COPY --from=appimagecrafters/docker-glib /usr/local /usr/local

RUN yum install -y xz automake autoconf libtool

ARG PIXMAN_VERSION=0.38.4
RUN /install-pixman.sh