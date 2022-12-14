# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ohw <ohw@student.42seoul.kr>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/23 02:36:10 by ohw               #+#    #+#              #
#    Updated: 2022/01/08 14:50:22 by ohw              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = clang
CFLAGS = -Wall -Wextra -Werror
NAME=libftprintf.a
SRCSDIR=srcs
INCS=./
SRCS=ft_isalpha.c ft_isdigit.c ft_isalnum.c\
	 ft_isascii.c ft_isprint.c ft_strlen.c\
	 ft_memset.c ft_bzero.c ft_memcpy.c\
	 ft_memmove.c ft_strlcpy.c ft_strlcat.c\
	 ft_toupper.c ft_tolower.c ft_strchr.c\
	 ft_strrchr.c ft_strncmp.c ft_memchr.c\
	 ft_memcmp.c ft_strnstr.c ft_atoi.c\
	 ft_calloc.c ft_strdup.c\
	 ft_substr.c ft_strjoin.c ft_strtrim.c\
	 ft_split.c ft_itoa.c ft_strmapi.c\
	 ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c\
	 ft_putstr_precision.c ft_putendl_fd.c ft_putnbr_fd.c\
	 ft_checkdigit.c ft_checkdigit_address.c\
	 ft_putnbr_base_fd.c ft_putnbr_base_precision.c\
	 ft_putaddress_fd.c ft_putaddress_precision.c\
	 ft_printf.c ft_printf_nbr.c ft_printf_non_nbr.c

BONUS=ft_lstnew.c ft_lstadd_front.c ft_lstsize.c\
	  ft_lstlast.c ft_lstadd_back.c ft_lstdelone.c\
	  ft_lstclear.c ft_lstiter.c ft_lstmap.c
OBJS=${SRCS:.c=.o}

OBJSBNS=${BONUS:.c=.o}

ifdef WITH_BONUS
    OBJ_FILES = $(OBJS) $(OBJSBNS)
else
    OBJ_FILES = $(OBJS)
endif

.PHONY: all clean fclean re

all : $(NAME)

$(NAME) : $(OBJ_FILES)
	ar rc $(NAME) $(OBJ_FILES)

bonus : 
	make WITH_BONUS=1 all

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@ -I$(INCS)

clean:
	rm -f $(OBJS) $(OBJSBNS)

fclean: clean
	rm -f $(NAME)

re: fclean all
